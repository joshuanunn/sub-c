type opts = {
  folding : bool;
  propagation : bool;
  unreachable : bool;
  deadstores : bool;
}

let unpack_opts flags =
  {
    folding = flags land 1 <> 0;
    propagation = flags land 2 <> 0;
    unreachable = flags land 4 <> 0;
    deadstores = flags land 8 <> 0;
  }

let int_of_bool (b : bool) : int = if b then 1 else 0

let fold_unop (op : Ir.unary_operator) (n : int) : int option =
  match op with
  | Negate -> Some (-n)
  | BwNot -> Some (lnot n)
  | Not -> Some (int_of_bool (n = 0))
  | PreIncrement | PreDecrement | PostIncrement | PostDecrement -> None

let fold_binop (op : Ir.binary_operator) (n1 : int) (n2 : int) : int option =
  match op with
  | Add -> Some (n1 + n2)
  | Subtract -> Some (n1 - n2)
  | Multiply -> Some (n1 * n2)
  | Divide -> if n2 = 0 then None else Some (n1 / n2)
  | Remainder -> if n2 = 0 then None else Some (n1 mod n2)
  | BwLeftShift -> Some (Int.shift_left n1 n2)
  | BwRightShift -> Some (Int.shift_right n1 n2)
  | BwAnd -> Some (n1 land n2)
  | BwXor -> Some (n1 lxor n2)
  | BwOr -> Some (n1 lor n2)
  | Equal -> Some (int_of_bool (n1 = n2))
  | NotEqual -> Some (int_of_bool (n1 <> n2))
  | LessOrEqual -> Some (int_of_bool (n1 <= n2))
  | GreaterOrEqual -> Some (int_of_bool (n1 >= n2))
  | LessThan -> Some (int_of_bool (n1 < n2))
  | GreaterThan -> Some (int_of_bool (n1 > n2))

let constant_folding (i : Ir.instruction) : Ir.instruction option =
  match i with
  | Unary { op; src = Constant n; dst } -> (
      match fold_unop op n with
      | Some v -> Some (Copy { src = Constant v; dst })
      | None -> Some i)
  | Binary { op; src1 = Constant n1; src2 = Constant n2; dst } -> (
      match fold_binop op n1 n2 with
      | Some v -> Some (Copy { src = Constant v; dst })
      | None -> Some i)
  | JumpIfZero { condition = Constant 0; target } -> Some (Jump { target })
  | JumpIfZero { condition = Constant _; _ } -> None
  | JumpIfNotZero { condition = Constant 0; _ } -> None
  | JumpIfNotZero { condition = Constant _; target } -> Some (Jump { target })
  | ins -> Some ins

let is_label = function Ir.Label _ -> true | _ -> false

let is_terminator = function
  | Ir.Jump _ | Ir.JumpIfZero _ | Ir.JumpIfNotZero _ | Ir.Return _ -> true
  | _ -> false

let instructions_to_cfg (ins : Ir.instruction list) : Cfg.graph =
  let cfg = Cfg.make_cfg () in
  let current_block = ref [] in

  let flush () =
    if !current_block <> [] then begin
      Cfg.insert_block cfg (List.rev !current_block);
      current_block := []
    end
  in

  List.iter
    (fun instr ->
      if is_label instr then begin
        flush ();
        current_block := [ instr ]
      end
      else begin
        current_block := instr :: !current_block;
        if is_terminator instr then flush ()
      end)
    ins;

  flush ();
  Cfg.add_all_edges cfg;
  cfg

let cfg_to_instructions (cfg : Cfg.graph) : Ir.instruction list =
  Hashtbl.fold (fun id node acc -> (id, node) :: acc) cfg.blocks []
  |> List.sort (fun (a, _) (b, _) -> compare a b)
  |> List.concat_map (fun (_, node) -> Cfg.get_instructions node)

let unreachable_code_elimination (cfg : Cfg.graph) : unit =
  Cfg.remove_unreachable_blocks cfg;
  Cfg.remove_redundant_jumps cfg;
  Cfg.remove_redundant_labels cfg;
  Cfg.remove_empty_blocks cfg

let copy_propagation (cfg : Cfg.graph) (statics : Cfg.StringSet.t) : unit =
  let reaching_copies = Cfg.find_reaching_copies cfg statics in
  Cfg.rewrite_cfg cfg reaching_copies

let optimise (body : Ir.instruction list) (o : opts) (statics : Cfg.StringSet.t)
    : Ir.instruction list =
  let rec loop body =
    if body = [] then body
    else
      let post_folding =
        if o.folding then List.filter_map constant_folding body else body
      in

      let cfg = instructions_to_cfg post_folding in

      if o.unreachable then unreachable_code_elimination cfg;
      if o.propagation then copy_propagation cfg statics;

      (*if o.deadstores then dead_store_elimination cfg;*)
      let body_opt = cfg_to_instructions cfg in
      if body_opt = body || body_opt = [] then body_opt else loop body_opt
  in
  loop body

let extract_static_names (f : Ir.top_level) : Cfg.StringSet.t =
  match f with
  | Function _ -> Cfg.StringSet.empty
  | StaticVariable { name; _ } -> Cfg.StringSet.singleton name

(** Construct a set of all static variable names. *)
let collect_static_names (prog : Ir.top_level list) : Cfg.StringSet.t =
  List.fold_left
    (fun acc f -> Cfg.StringSet.union acc (extract_static_names f))
    Cfg.StringSet.empty prog

let optimise_func (f : Ir.top_level) (o : opts) (statics : Cfg.StringSet.t) :
    Ir.top_level =
  (* only optimise function bodies *)
  match f with
  | Function { name; global; params; body; frame } ->
      let body_opt = optimise body o statics in
      Function { name; global; params; body = body_opt; frame }
  | StaticVariable { name; global; init } ->
      StaticVariable { name; global; init }

let optimise_prog (Program p : Ir.prog) (o : opts) : Ir.prog =
  let statics = collect_static_names p in
  let compiled_funcs = List.map (function f -> optimise_func f o statics) p in
  Ir.Program compiled_funcs
