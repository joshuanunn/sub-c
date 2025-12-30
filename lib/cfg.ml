(** Define control-flow graph data structures. Used in IR optimisation for copy
    propagation, unreachable code elimination and dead store elimination.*)

module IntSet = Set.Make (Int)

type node_id = Entry | Exit | Block of int

type node =
  | BasicBlock of {
      id : int;
      mutable instructions : Ir.instruction list;
      mutable predecessors : node_id list;
      mutable successors : node_id list;
    }
  | EntryNode of { mutable successors : node_id list }
  | ExitNode of { mutable predecessors : node_id list }

type graph = {
  entry : node;
  exit : node;
  blocks : (int, node) Hashtbl.t;
  mutable counter : int; (* Counter for generating block ID *)
}

(** Create a new, empty control-flow graph *)
let make_cfg () : graph =
  let entry = EntryNode { successors = [] } in
  let exit = ExitNode { predecessors = [] } in
  let blocks = Hashtbl.create 16 in

  { entry; exit; blocks; counter = 0 }

let insert_block (cfg : graph) (ins : Ir.instruction list) : unit =
  let id = cfg.counter in
  let block =
    BasicBlock { id; instructions = ins; predecessors = []; successors = [] }
  in
  Hashtbl.add cfg.blocks id block;
  cfg.counter <- cfg.counter + 1;
  ()

let get_node (cfg : graph) (id : node_id) : node =
  match id with
  | Entry -> cfg.entry
  | Exit -> cfg.exit
  | Block i -> Hashtbl.find cfg.blocks i

let get_instructions = function
  | BasicBlock r -> r.instructions
  | EntryNode _ | ExitNode _ ->
      failwith "only BasicBlock nodes contain instructions"

let add_unique (x : node_id) (xs : node_id list) : node_id list =
  if List.mem x xs then xs else x :: xs

let add_successor (n : node) (id : node_id) =
  match n with
  | EntryNode r -> r.successors <- add_unique id r.successors
  | BasicBlock r -> r.successors <- add_unique id r.successors
  | ExitNode _ -> failwith "ExitNodes cannot have successors"

let add_predecessor (n : node) (id : node_id) =
  match n with
  | ExitNode r -> r.predecessors <- add_unique id r.predecessors
  | BasicBlock r -> r.predecessors <- add_unique id r.predecessors
  | EntryNode _ -> failwith "EntryNodes cannot have predecessors"

let add_edge (cfg : graph) (from_id : node_id) (to_id : node_id) =
  let from_node = get_node cfg from_id in
  let to_node = get_node cfg to_id in
  add_successor from_node to_id;
  add_predecessor to_node from_id

(** Build a map from labels to block IDs *)
let build_label_map (cfg : graph) : (string, int) Hashtbl.t =
  let tbl = Hashtbl.create 16 in
  Hashtbl.iter
    (fun id node ->
      match node with
      | BasicBlock { instructions; _ } -> (
          match instructions with
          | Ir.Label l :: _ -> Hashtbl.add tbl l id
          | _ -> ())
      | _ -> ())
    cfg.blocks;
  tbl

let get_block_by_label (label_map : (string, int) Hashtbl.t) (label : string) :
    int =
  Hashtbl.find label_map label

let add_all_edges (cfg : graph) : unit =
  let max_id = cfg.counter - 1 in
  (* Build edge from Entry node to first block *)
  add_edge cfg Entry (Block 0);

  (* Construct lookup from instruction target Label to CFG block ID *)
  let label_map = build_label_map cfg in

  Hashtbl.iter
    (fun id node ->
      match node with
      | BasicBlock { instructions; _ } ->
          (* Get reference to current node and next (default) node. If last
          node, then next_id is Exit node *)
          let node_id = Block id in
          let next_id = if id = max_id then Exit else Block (id + 1) in
          (* To build edge, use last instruction in node to choose edges *)
          begin match List.rev instructions with
          | [] -> add_edge cfg node_id next_id
          | last_instr :: _ -> begin
              match last_instr with
              (* Return instructions always link to Exit node *)
              | Ir.Return _ -> add_edge cfg node_id Exit
              (* Unconditional Jump has only a single link *)
              | Ir.Jump { target } ->
                  let target_id = get_block_by_label label_map target in
                  add_edge cfg node_id (Block target_id)
              (* Conditional Jumps have two possible links *)
              | Ir.JumpIfZero { target; _ } | Ir.JumpIfNotZero { target; _ } ->
                  let target_id = get_block_by_label label_map target in
                  add_edge cfg node_id (Block target_id);
                  add_edge cfg node_id next_id
              (* All other instructions "fall through" to default node *)
              | _ -> add_edge cfg node_id next_id
            end
          end
      | _ -> ())
    cfg.blocks

let reachable_blocks (cfg : graph) : IntSet.t =
  let visited = ref IntSet.empty in

  let rec dfs_block id =
    if IntSet.mem id !visited then ()
    else begin
      visited := IntSet.add id !visited;
      let node = Hashtbl.find cfg.blocks id in
      match node with
      | BasicBlock { successors; _ } ->
          List.iter
            (function Block i -> dfs_block i | Exit -> () | Entry -> ())
            successors
      | _ -> ()
    end
  in

  (* EntryNode always goes to block 0 *)
  dfs_block 0;
  !visited

let clean_edges (valid : IntSet.t) =
  List.filter (function Block i -> IntSet.mem i valid | _ -> true)

let valid_blocks (cfg : graph) =
  Hashtbl.fold (fun id _ acc -> IntSet.add id acc) cfg.blocks IntSet.empty

let valid_node_id (cfg : graph) = function
  | Block i -> IntSet.mem i (valid_blocks cfg)
  | Entry | Exit -> true

let remove_unreachable_blocks (cfg : graph) : unit =
  let reachable = reachable_blocks cfg in

  (* Remove unreachable blocks *)
  Hashtbl.filter_map_inplace
    (fun id node -> if IntSet.mem id reachable then Some node else None)
    cfg.blocks;

  (* Update edges *)
  Hashtbl.iter
    (fun _ node ->
      match node with
      | BasicBlock r ->
          r.predecessors <- clean_edges reachable r.predecessors;
          r.successors <- clean_edges reachable r.successors
      | EntryNode r -> r.successors <- clean_edges reachable r.successors
      | ExitNode _ -> ())
    cfg.blocks;

  (* Finally clean up edges on ExitNode *)
  match cfg.exit with
  | ExitNode r ->
      r.predecessors <- List.filter (valid_node_id cfg) r.predecessors
  | _ -> ()

let is_jump = function
  | Ir.Jump _ | Ir.JumpIfZero _ | Ir.JumpIfNotZero _ -> true
  | _ -> false

let remove_leading_label instrs =
  match instrs with Ir.Label _ :: rest -> rest | _ -> instrs

let remove_last_instruction instrs =
  match List.rev instrs with _ :: rest_rev -> List.rev rest_rev | [] -> []

let pairwise lst =
  let rec aux acc = function
    | x :: (y :: _ as tl) -> aux ((x, y) :: acc) tl
    | _ -> List.rev acc
  in
  aux [] lst

(** Remove redundant jump instructions. Any conditional or unconditional jump
    instructions at the end of a basic block, which target the (default) next
    block can be removed as these have no effect. Any associated redundant
    labels will be removed in the next step.*)
let remove_redundant_jumps (cfg : graph) : unit =
  let sorted_blocks =
    Hashtbl.fold (fun id node acc -> (id, node) :: acc) cfg.blocks []
    |> List.sort (fun (a, _) (b, _) -> compare a b)
    |> List.map snd
  in

  List.iter
    (fun (block, next_block) ->
      match (block, next_block) with
      | BasicBlock r, BasicBlock r_next -> (
          match List.rev r.instructions with
          | last :: _ when is_jump last ->
              let default_succ = Block r_next.id in
              let keep_jump =
                List.exists (fun succ -> succ <> default_succ) r.successors
              in
              if not keep_jump then
                r.instructions <- remove_last_instruction r.instructions
          | _ -> ())
      | _ -> ())
    (pairwise sorted_blocks)

(** Remove redundant labels. Sort basic blocks by ID, then delete any Label
    instruction at the start of a block if it's only entered by "falling
    through" from the previous block, rather than via an explicit jump. The
    Label at the start of sorted_blocks[i] can be deleted if its only
    predecessor is sorted_blocks[i - 1]. The Label at the start of
    sorted_blocks[0] is deleted if its only predecessor is Entry.*)
let remove_redundant_labels (cfg : graph) : unit =
  let sorted_blocks =
    Hashtbl.fold (fun id node acc -> (id, node) :: acc) cfg.blocks []
    |> List.sort (fun (a, _) (b, _) -> compare a b)
    |> List.map snd
  in

  (* Handle first block *)
  (match sorted_blocks with
  | BasicBlock r :: _ ->
      if r.predecessors = [ Entry ] then
        r.instructions <- remove_leading_label r.instructions
  | _ -> ());

  (* Handle remaining blocks *)
  List.iter
    (fun (prev_block, block) ->
      match (prev_block, block) with
      | BasicBlock r_prev, BasicBlock r ->
          if r.predecessors = [ Block r_prev.id ] then
            r.instructions <- remove_leading_label r.instructions
      | _ -> ())
    (pairwise sorted_blocks)

let is_empty_block = function
  | BasicBlock { instructions = []; _ } -> true
  | _ -> false

let empty_blocks (cfg : graph) : IntSet.t =
  Hashtbl.fold
    (fun id node acc -> if is_empty_block node then IntSet.add id acc else acc)
    cfg.blocks IntSet.empty

let splice_out_block (cfg : graph) (id : int) =
  (* Get the predecessors and successors of the block being removed *)
  let predecessors, successors =
    match Hashtbl.find cfg.blocks id with
    | BasicBlock { predecessors; successors; _ } -> (predecessors, successors)
    | _ -> failwith "expected basic block"
  in

  (* Remove this block from its successors' predecessors *)
  List.iter
    (fun succ ->
      match get_node cfg succ with
      | BasicBlock r ->
          r.predecessors <- List.filter (( <> ) (Block id)) r.predecessors
      | ExitNode r ->
          r.predecessors <- List.filter (( <> ) (Block id)) r.predecessors
      | EntryNode _ -> ())
    successors;

  (* Update predecessors to skip over the removed block *)
  List.iter
    (fun pred ->
      match get_node cfg pred with
      | EntryNode r ->
          r.successors <-
            List.filter (( <> ) (Block id)) r.successors @ successors
      | BasicBlock r ->
          r.successors <-
            List.filter (( <> ) (Block id)) r.successors @ successors
      | ExitNode _ -> ())
    predecessors;

  (* Update successors to include the predecessors of the removed block *)
  List.iter
    (fun succ ->
      match get_node cfg succ with
      | BasicBlock r ->
          r.predecessors <-
            List.fold_left
              (fun acc p -> if List.mem p acc then acc else p :: acc)
              r.predecessors predecessors
      | ExitNode r ->
          r.predecessors <-
            List.fold_left
              (fun acc p -> if List.mem p acc then acc else p :: acc)
              r.predecessors predecessors
      | EntryNode _ -> ())
    successors

(** Remove any empty blocks *)
let remove_empty_blocks (cfg : graph) : unit =
  (* Identify empty block nodes *)
  let empties = empty_blocks cfg in
  (* Update edges to route around empty block nodes *)
  IntSet.iter (splice_out_block cfg) empties;
  (* Finally, remove the empty block nodes *)
  Hashtbl.filter_map_inplace
    (fun id node -> if IntSet.mem id empties then None else Some node)
    cfg.blocks

let string_of_node_id = function
  | Entry -> "ENTRY"
  | Exit -> "EXIT"
  | Block i -> "B" ^ string_of_int i

let pp_instruction_line fmt ins =
  Format.fprintf fmt "    %s\n" (Ir.show_instruction ins)

let pp_node fmt = function
  | EntryNode { successors } ->
      Format.fprintf fmt "EntryNode\n";
      Format.fprintf fmt "  successors: [%s]\n\n"
        (String.concat ", " (List.map string_of_node_id successors))
  | ExitNode { predecessors } ->
      Format.fprintf fmt "ExitNode\n";
      Format.fprintf fmt "  predecessors: [%s]\n"
        (String.concat ", " (List.map string_of_node_id predecessors))
  | BasicBlock { id; instructions; predecessors; successors } ->
      Format.fprintf fmt "BasicBlock B%d\n" id;
      Format.fprintf fmt "  instructions:\n";
      List.iter (pp_instruction_line fmt) instructions;
      Format.fprintf fmt "  predecessors: [%s]\n"
        (String.concat ", " (List.map string_of_node_id predecessors));
      Format.fprintf fmt "  successors: [%s]\n"
        (String.concat ", " (List.map string_of_node_id successors))

let pp_graph fmt { entry; exit; blocks; counter } =
  Format.fprintf fmt "=== CFG ===\n";
  pp_node fmt entry;

  let blocks_sorted =
    Hashtbl.fold (fun id node acc -> (id, node) :: acc) blocks []
    |> List.sort (fun (a, _) (b, _) -> compare a b)
    |> List.map snd
  in

  List.iter
    (fun node ->
      pp_node fmt node;
      Format.fprintf fmt "\n")
    blocks_sorted;

  pp_node fmt exit;

  Format.fprintf fmt "\ncounter = %d\n" counter

let show_graph g = Format.asprintf "%a" pp_graph g
