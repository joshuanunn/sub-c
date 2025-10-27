open Ast

(* Declare static counter for unqiue loop labeling *)
let counter = ref 0

(** [loop_label] generates a new unique identifier for a loop. *)
let loop_label () : ident =
  incr counter;
  let label = Printf.sprintf "%d" !counter in
  Identifier label

(** [label_loop s label] traverses a statement [s] and:
    - Assigns a unique loop label to any while/do-while/for loops
    - Passes [label] (current parent loop label) to break/continue statements
      Raises [Failure] for break/continue outside loop or labeled loops. *)
let rec label_loop (s : Ast.stmt) (label : ident option) : Ast.stmt =
  match s with
  | If { cond_exp; then_smt; else_smt = None } ->
      If { cond_exp; then_smt = label_loop then_smt label; else_smt = None }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp;
          then_smt = label_loop then_smt label;
          else_smt = Some (label_loop stmt label);
        }
  | Compound b -> Compound (label_block b label)
  | Break _ -> (
      match label with
      | Some id -> Break (Some id)
      | None -> failwith "break statement outside of loop")
  | Continue _ -> (
      match label with
      | Some id -> Continue (Some id)
      | None -> failwith "continue statement outside of loop")
  | While { cond; body; id } -> (
      match id with
      | None ->
          let new_label = Some (loop_label ()) in
          While { cond; body = label_loop body new_label; id = new_label }
      | Some _ -> failwith "while loop has already been labeled")
  | DoWhile { body; cond; id } -> (
      match id with
      | None ->
          let new_label = Some (loop_label ()) in
          DoWhile { body = label_loop body new_label; cond; id = new_label }
      | Some _ -> failwith "dowhile loop has already been labeled")
  | For { init; cond; post; body; id } -> (
      match id with
      | None ->
          let new_label = Some (loop_label ()) in
          For
            {
              init;
              cond;
              post;
              body = label_loop body new_label;
              id = new_label;
            }
      | Some _ -> failwith "for loop has already been labeled")
  | Label (id, s) -> Label (id, label_loop s label)
  | _ -> s

(** [label_block b label] applies [label_loop] to every statement in block [b],
    propagating the current parent loop label [label]. *)
and label_block (b : Ast.block) (label : ident option) : Ast.block =
  let (Block item_list) = b in
  let analysed_items =
    List.map
      (fun item -> match item with D d -> D d | S s -> S (label_loop s label))
      item_list
  in
  Block analysed_items

(** [label_func f] labels all loops in function [f], assigning appropriate
    labels to break/continue statements. *)
let label_func (f : Ast.func) : Ast.func =
  match f with
  | Function fn ->
      let body = label_block fn.body None in
      Function { name = fn.name; body; return_type = fn.return_type }

(** [label_prog (Program p)] applies loop labeling to the entire program [p]. *)
let label_prog (Program p : Ast.prog) : Ast.prog = Program (label_func p)
