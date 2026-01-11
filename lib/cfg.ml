(** Define control-flow graph data structures. Used in IR optimisation for copy
    propagation, unreachable code elimination and dead store elimination.*)

module IntSet = Set.Make (Int)
module StringSet = Set.Make (String)

module CopySet = Set.Make (struct
  type t = Ir.instruction

  let compare = compare
end)

type node_id = Entry | Exit | Block of int

module InstrMap = Map.Make (struct
  type t = node_id * int (* block_id, instruction index *)

  let compare = compare
end)

(* This builds a lookup of reaching copies for each instruction in a block *)
type reaching_copies_info = CopySet.t InstrMap.t

type node =
  | BasicBlock of {
      id : int;
      mutable instructions : Ir.instruction list;
      mutable predecessors : node_id list;
      mutable successors : node_id list;
      mutable reaching_copies : CopySet.t;
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
    BasicBlock
      {
        id;
        instructions = ins;
        predecessors = [];
        successors = [];
        reaching_copies = CopySet.empty;
      }
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

let get_block_copies (n : node) : CopySet.t =
  match n with
  | BasicBlock r ->
      List.fold_left
        (fun acc instr ->
          match instr with Ir.Copy _ -> CopySet.add instr acc | _ -> acc)
        CopySet.empty r.instructions
  | EntryNode _ | ExitNode _ -> CopySet.empty

(** Construct a preliminary set of all copy instructions across all blocks. *)
let find_all_copy_instructions (blocks : node list) : CopySet.t =
  List.fold_left
    (fun acc block ->
      match block with
      | BasicBlock _ -> CopySet.union acc (get_block_copies block)
      | _ -> acc)
    CopySet.empty blocks

let set_block_annotation (cfg : graph) (id : node_id) (copies : CopySet.t) =
  match get_node cfg id with
  | BasicBlock r -> r.reaching_copies <- copies
  | EntryNode _ | ExitNode _ ->
      failwith "cannot set a block annotation for EntryNode or ExitNode"

let get_block_annotation (cfg : graph) (id : node_id) =
  match get_node cfg id with
  | BasicBlock r -> r.reaching_copies
  | EntryNode _ | ExitNode _ ->
      failwith "cannot get block annotation for EntryNode or ExitNode"

(** Meet operator for reaching copies analysis. Computes the set of copy
    instructions that reach the beginning of a basic block by taking the
    intersection of the reaching copies at the end of all predecessor blocks. If
    the block has Entry as a predecessor, the result is the empty set. *)
let meet (cfg : graph) (id : node_id) (all_copies : CopySet.t) =
  let predecessors =
    match get_node cfg id with
    | BasicBlock r -> r.predecessors
    | _ -> failwith "meet applied to a non-BasicBlock"
  in

  List.fold_left
    (fun incoming_copies prec_id ->
      match prec_id with
      | Entry -> CopySet.empty
      | Block _ ->
          let pred_out_copies = get_block_annotation cfg prec_id in
          CopySet.inter incoming_copies pred_out_copies
      | Exit -> failwith "malformed control-flow graph")
    all_copies predecessors

(** Special case where x = y reaches y = x, which has no effect. *)
let is_inverse_copy instr copies =
  match instr with
  | Ir.Copy { src; dst } ->
      CopySet.mem (Ir.Copy { src = dst; dst = src }) copies
  | _ -> false

(** Kill any copies to or from x, following x = y. *)
let kill_copy_dest dst copies =
  CopySet.filter
    (fun c ->
      match c with
      | Ir.Copy { src; dst = d } -> src <> dst && d <> dst
      | _ -> true)
    copies

(** Check if variable is static. *)
let is_static (value : Ir.value) (static_names : StringSet.t) : bool =
  match value with Ir.Var name -> StringSet.mem name static_names | _ -> false

(** Kill copies to or from variables with static storage duration or any copies
    to or from the destination of the result from the function call. *)
let kill_for_fun_call dst static_names copies =
  CopySet.filter
    (fun c ->
      match c with
      | Ir.Copy { src; dst = d } ->
          not
            (is_static src static_names || is_static d static_names || src = dst
           || d = dst)
      | _ -> true)
    copies

(** Transfer function for reaching copies analysis. Given the set of copies that
    reach the beginning of a basic block, iterates over the block’s
    instructions, annotating each instruction with the copies that reach just
    before it and updating the current reaching copies. At the end of the block,
    records the set of copies that reach the block’s exit. *)
let transfer (cfg : graph) (id : node_id) initial_reaching_copies static_names
    instr_info =
  let current_reaching_copies = ref initial_reaching_copies in

  let block_instructions =
    match get_node cfg id with
    | BasicBlock r -> r.instructions
    | _ -> failwith "transfer applied to a non-BasicBlock"
  in

  List.iteri
    (fun idx instruction ->
      (* Annotate instruction with all reaching copies to just before instruction *)
      instr_info := InstrMap.add (id, idx) !current_reaching_copies !instr_info;

      (* Update reaching copies *)
      match instruction with
      | Ir.Copy { dst; _ } ->
          if not (is_inverse_copy instruction !current_reaching_copies) then begin
            current_reaching_copies :=
              !current_reaching_copies |> kill_copy_dest dst
              |> CopySet.add instruction
          end
      | Ir.FunCall { dst; _ } ->
          current_reaching_copies :=
            kill_for_fun_call dst static_names !current_reaching_copies
      | Ir.Unary { dst; _ } | Ir.Binary { dst; _ } ->
          current_reaching_copies := kill_copy_dest dst !current_reaching_copies
      | _ -> ())
    block_instructions;

  (* Finally, update block (end) reaching copies with surviving copies *)
  set_block_annotation cfg id !current_reaching_copies

(** Add successors of processed block to worklist, if not already present *)
let update_worklist (cfg : graph) (id : node_id) (worklist : IntSet.t) =
  match get_node cfg id with
  | BasicBlock { successors; _ } ->
      List.fold_left
        (fun wl succ ->
          match get_node cfg succ with
          | ExitNode _ -> wl
          | EntryNode _ -> failwith "malformed control-flow graph"
          | BasicBlock { id; _ } -> IntSet.add id wl)
        worklist successors
  | _ -> failwith "can only update worklist from a processed BasicBlock"

(** Preliminary annotation of reaching copies for each block. Sort basic blocks
    by ID, then annotate each block with the set of cumulative copy instructions
    which are assumed to have reached the end of each block. Entry and Exit
    nodes are not annotated. *)
let find_reaching_copies (cfg : graph) (static_names : StringSet.t) =
  let sorted_blocks =
    Hashtbl.fold (fun id node acc -> (id, node) :: acc) cfg.blocks []
    |> List.sort (fun (a, _) (b, _) -> compare a b)
    |> List.map snd
  in
  let all_copies = find_all_copy_instructions sorted_blocks in

  (* Preliminary annotation of all BasicBlocks with copies from all blocks and
  build a set of work items to process. *)
  let worklist = ref IntSet.empty in
  List.iter
    (fun block ->
      match block with
      | BasicBlock r ->
          r.reaching_copies <- all_copies;
          worklist := IntSet.add r.id !worklist
      | _ -> ())
    sorted_blocks;

  let instr_info = ref InstrMap.empty in

  (* Iteratively resolve reaching copies for each block *)
  while not (IntSet.is_empty !worklist) do
    (* Remove first block from worklist *)
    let block_id = IntSet.min_elt !worklist in
    worklist := IntSet.remove block_id !worklist;
    let block = Block block_id in
    let old_annotation = get_block_annotation cfg block in

    (* Apply meet and transfer functions to block *)
    let incoming_copies = meet cfg block all_copies in
    transfer cfg block incoming_copies static_names instr_info;

    (* Update worklist *)
    if old_annotation <> get_block_annotation cfg block then begin
      worklist := update_worklist cfg block !worklist
    end
  done;
  !instr_info

(** Replace a value operand using reaching copies information. If the operand is
    a variable and there exists a reaching copy that assigns to it, the operand
    is replaced with the copy’s source. Constants and operands without a
    defining reaching copy are returned unchanged. *)
let replace_operand (op : Ir.value) (copies : CopySet.t) : Ir.value =
  match op with
  | Ir.Constant _ -> op
  | Ir.Var _ -> (
      match
        CopySet.find_first_opt
          (function Ir.Copy { dst; _ } when dst = op -> true | _ -> false)
          copies
      with
      | Some (Ir.Copy { src; _ }) -> src
      | _ -> op)

(** Rewrite a single IR instruction using the set of reaching copies that apply
    immediately before it. Source operands are replaced where possible using
    copy propagation. Redundant Copy instructions whose effect is already
    guaranteed by reaching copies are removed by returning None. *)
let rewrite_instruction (instr : Ir.instruction) (copies : CopySet.t) :
    Ir.instruction option =
  match instr with
  | Ir.Copy { src; dst } ->
      let redundant =
        CopySet.exists
          (function
            | Ir.Copy { src = s; dst = d } ->
                (s = src && d = dst) || (s = dst && d = src)
            | _ -> false)
          copies
      in
      if redundant then None
      else
        let new_src = replace_operand src copies in
        Some (Ir.Copy { src = new_src; dst })
  | Ir.Unary { op; src; dst } ->
      let new_src = replace_operand src copies in
      Some (Ir.Unary { op; src = new_src; dst })
  | Ir.Binary { op; src1; src2; dst } ->
      let new_src1 = replace_operand src1 copies in
      let new_src2 = replace_operand src2 copies in
      Some (Ir.Binary { op; src1 = new_src1; src2 = new_src2; dst })
  | Ir.Return v -> Some (Ir.Return (replace_operand v copies))
  | Ir.JumpIfZero { condition; target } ->
      let new_condition = replace_operand condition copies in
      Some (Ir.JumpIfZero { condition = new_condition; target })
  | Ir.JumpIfNotZero { condition; target } ->
      let new_condition = replace_operand condition copies in
      Some (Ir.JumpIfNotZero { condition = new_condition; target })
  | Ir.FunCall { fun_name; args; dst } ->
      let new_args = List.map (fun a -> replace_operand a copies) args in
      Some (Ir.FunCall { fun_name; args = new_args; dst })
  | Ir.Label _ | Ir.Jump _ -> Some instr

let rewrite_block (block_id : int) (instrs : Ir.instruction list)
    (instr_info : CopySet.t InstrMap.t) : Ir.instruction list =
  instrs
  |> List.mapi (fun idx instr ->
      let copies = InstrMap.find (Block block_id, idx) instr_info in
      rewrite_instruction instr copies)
  |> List.filter_map Fun.id

(** Rewrite all basic blocks in a control-flow graph using instruction-level
    reaching copies information. Each instruction is rewritten or removed
    according to copy propagation rules, and the instructions within each basic
    block are updated in place. *)
let rewrite_cfg (cfg : graph) (instr_info : CopySet.t InstrMap.t) =
  Hashtbl.iter
    (fun _ node ->
      match node with
      | BasicBlock r ->
          r.instructions <- rewrite_block r.id r.instructions instr_info
      | _ -> ())
    cfg.blocks

let string_of_node_id = function
  | Entry -> "ENTRY"
  | Exit -> "EXIT"
  | Block i -> "B" ^ string_of_int i

let pp_instruction_line fmt ins =
  Format.fprintf fmt "    %s\n" (Ir.show_instruction ins)

let pp_copyset fmt copies =
  CopySet.elements copies |> List.iter (pp_instruction_line fmt)

let pp_node fmt = function
  | EntryNode { successors } ->
      Format.fprintf fmt "EntryNode\n";
      Format.fprintf fmt "  successors: [%s]\n\n"
        (String.concat ", " (List.map string_of_node_id successors))
  | ExitNode { predecessors } ->
      Format.fprintf fmt "ExitNode\n";
      Format.fprintf fmt "  predecessors: [%s]\n"
        (String.concat ", " (List.map string_of_node_id predecessors))
  | BasicBlock { id; instructions; predecessors; successors; reaching_copies }
    ->
      Format.fprintf fmt "BasicBlock B%d\n" id;
      Format.fprintf fmt "  instructions:\n";
      List.iter (pp_instruction_line fmt) instructions;
      Format.fprintf fmt "  predecessors: [%s]\n"
        (String.concat ", " (List.map string_of_node_id predecessors));
      Format.fprintf fmt "  successors: [%s]\n"
        (String.concat ", " (List.map string_of_node_id successors));
      Format.fprintf fmt "  reaching_copies:\n";
      pp_copyset fmt reaching_copies

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
