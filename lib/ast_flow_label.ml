open Ast

(* Control contexts to represent nested loops and switches. *)
type context = LoopCtx of ident | SwitchCtx of ident

(* Declare static counter for unique loop and switch labeling *)
let counter = ref 0

(** [loop_label] generates a new unique identifier for a loop. *)
let loop_label () : ident =
  incr counter;
  LoopLabel (Printf.sprintf "%d" !counter)

(** [switch_label] generates a new unique identifier for a switch. *)
let switch_label () : ident =
  incr counter;
  SwitchLabel (Printf.sprintf "%d" !counter)

(** Get the current active control label for a [break] statement. This must be
    the innermost loop or switch on the stack. *)
let break_target (stack : context list) : ident option =
  match stack with
  | [] -> None
  | LoopCtx id :: _ -> Some id
  | SwitchCtx id :: _ -> Some id

(** Get the current active control label for a [continue] statement. This must
    be the innermost loop on the stack. *)
let continue_target (stack : context list) : ident option =
  match List.find_opt (function LoopCtx _ -> true | _ -> false) stack with
  | Some (LoopCtx id) -> Some id
  | _ -> None

(** [label_control_stmt s label] traverses a statement [s] and:
    - assigns unique labels to loops and switches
    - labels [break]/[continue] with the innermost enclosing construct *)
let rec label_control_stmt (s : Ast.stmt) (stack : context list) : Ast.stmt =
  match s with
  | If { cond_exp; then_smt; else_smt = None } ->
      If
        {
          cond_exp;
          then_smt = label_control_stmt then_smt stack;
          else_smt = None;
        }
  | If { cond_exp; then_smt; else_smt = Some stmt } ->
      If
        {
          cond_exp;
          then_smt = label_control_stmt then_smt stack;
          else_smt = Some (label_control_stmt stmt stack);
        }
  | Compound b -> Compound (label_block b stack)
  | Break _ -> (
      match break_target stack with
      | Some id -> Break (Some id)
      | None -> failwith "break statement outside of loop or switch")
  | Continue _ -> (
      match continue_target stack with
      | Some id -> Continue (Some id)
      | None -> failwith "continue statement outside of loop")
  | While { cond; body; id } -> (
      match id with
      | None ->
          let new_id = loop_label () in
          let new_stack = LoopCtx new_id :: stack in
          While
            { cond; body = label_control_stmt body new_stack; id = Some new_id }
      | Some _ -> failwith "while loop has already been labeled")
  | DoWhile { body; cond; id } -> (
      match id with
      | None ->
          let new_id = loop_label () in
          let new_stack = LoopCtx new_id :: stack in
          DoWhile
            { body = label_control_stmt body new_stack; cond; id = Some new_id }
      | Some _ -> failwith "dowhile loop has already been labeled")
  | For { init; cond; post; body; id } -> (
      match id with
      | None ->
          let new_id = loop_label () in
          let new_stack = LoopCtx new_id :: stack in
          For
            {
              init;
              cond;
              post;
              body = label_control_stmt body new_stack;
              id = Some new_id;
            }
      | Some _ -> failwith "for loop has already been labeled")
  | Switch { cond; body; id } -> (
      match id with
      | None ->
          let new_id = switch_label () in
          let new_stack = SwitchCtx new_id :: stack in
          Switch
            { cond; body = label_control_stmt body new_stack; id = Some new_id }
      | Some _ -> failwith "switch statement has already been labeled")
  | Case { value; body } -> Case { value; body = label_control_stmt body stack }
  | Default { body } -> Default { body = label_control_stmt body stack }
  | Label (id, s) -> Label (id, label_control_stmt s stack)
  | _ -> s

(** [label_block b stack] applies [label_control_stmt] to items in block [b]. *)
and label_block (b : Ast.block) (stack : context list) : Ast.block =
  let (Block items) = b in
  let labelled_items =
    List.map
      (function D d -> D d | S s -> S (label_control_stmt s stack))
      items
  in
  Block labelled_items

(** [label_func f] labels all control statements in function [f]. *)
let label_func (f : Ast.func) : Ast.func =
  match f with
  | Function fn ->
      let body = label_block fn.body [] in
      Function { name = fn.name; body; return_type = fn.return_type }

(** [label_prog p] applies labeling to the entire program [p]. *)
let label_prog (Program p : Ast.prog) : Ast.prog = Program (label_func p)
