open Ast
open Env
open Ir

let ident_to_string = function Identifier s -> s

let update_op (u : Ast.unop) : Ir.binary_operator =
  match u with
  | PreIncrement -> Add
  | PreDecrement -> Subtract
  | PostIncrement -> Add
  | PostDecrement -> Subtract
  | _ -> failwith "cannot map AST unary update operator to IR binary operator"

let convert_unop (u : Ast.unop) : Ir.unary_operator =
  match u with
  | BwNot -> BwNot
  | Negate -> Negate
  | Not -> Not
  | PreIncrement -> PreIncrement
  | PreDecrement -> PreDecrement
  | PostIncrement -> PostIncrement
  | PostDecrement -> PostDecrement

let convert_binop (u : Ast.binop) : Ir.binary_operator =
  match u with
  | Add -> Add
  | Subtract -> Subtract
  | Multiply -> Multiply
  | Divide -> Divide
  | Remainder -> Remainder
  | BwLeftShift -> BwLeftShift
  | BwRightShift -> BwRightShift
  | BwAnd -> BwAnd
  | BwXor -> BwXor
  | BwOr -> BwOr
  | Equal -> Equal
  | NotEqual -> NotEqual
  | LessOrEqual -> LessOrEqual
  | GreaterOrEqual -> GreaterOrEqual
  | LessThan -> LessThan
  | GreaterThan -> GreaterThan
  | _ -> failwith "cannot compile AST binary operator to IR binary"

let rec convert_expr (v : Ast.expr) (e : Env.senv) :
    Ir.value * Ir.instruction list =
  match v with
  | LiteralInt n -> (Constant n, [])
  (* Insert any AST Vars into IR Vars, as names are gaurunteed unique *)
  | Var (Identifier v) -> (Var v, [])
  | Unary { op : unop; exp : expr } -> (
      let src, src_instructions = convert_expr exp e in
      match op with
      (* Pre-update unary ops: adjust variable and return updated value *)
      | PreIncrement | PreDecrement ->
          let ins_adjust_var =
            Binary
              { op = update_op op; src1 = src; src2 = Constant 1; dst = src }
          in
          (src, [ ins_adjust_var ])
      (* Post-update unary ops: adjust variable and return original value *)
      | PostIncrement | PostDecrement ->
          let tmp = Var (declare_value "tmp" e) in
          let ins_copy_tmp = Copy { src; dst = tmp } in
          let ins_adjust_var =
            Binary
              { op = update_op op; src1 = src; src2 = Constant 1; dst = src }
          in
          (tmp, [ ins_copy_tmp ] @ [ ins_adjust_var ])
      (* Everything else *)
      | _ ->
          let tmp = Var (declare_value "tmp" e) in
          let instruction = Unary { op = convert_unop op; src; dst = tmp } in
          (tmp, src_instructions @ [ instruction ]))
  | Binary { op = And; left : expr; right : expr } ->
      let lhs, lhs_ins = convert_expr left e in
      let rhs, rhs_ins = convert_expr right e in
      let dst = Var (declare_value "tmp" e) in
      let lbs = declare_label "and_false" e in
      let lbe = declare_label "and_end" e in
      let jzl = JumpIfZero { condition = lhs; target = lbs } in
      let jzr = JumpIfZero { condition = rhs; target = lbs } in
      let c1 = Copy { src = Constant 1; dst } in
      let je = Jump { target = lbe } in
      let ls = Label lbs in
      let c0 = Copy { src = Constant 0; dst } in
      let le = Label lbe in
      (dst, lhs_ins @ [ jzl ] @ rhs_ins @ [ jzr; c1; je; ls; c0; le ])
  | Binary { op = Or; left : expr; right : expr } ->
      let lhs, lhs_ins = convert_expr left e in
      let rhs, rhs_ins = convert_expr right e in
      let dst = Var (declare_value "tmp" e) in
      let lbs = declare_label "or_true" e in
      let lbe = declare_label "or_end" e in
      let jzl = JumpIfNotZero { condition = lhs; target = lbs } in
      let jzr = JumpIfNotZero { condition = rhs; target = lbs } in
      let c0 = Copy { src = Constant 0; dst } in
      let je = Jump { target = lbe } in
      let ls = Label lbs in
      let c1 = Copy { src = Constant 1; dst } in
      let le = Label lbe in
      (dst, lhs_ins @ [ jzl ] @ rhs_ins @ [ jzr; c0; je; ls; c1; le ])
  | Binary { op : binop; left : expr; right : expr } ->
      let op = convert_binop op in
      let src1, src1_instructions = convert_expr left e in
      let src2, src2_instructions = convert_expr right e in
      let dst = Var (declare_value "tmp" e) in
      let instruction = Binary { op; src1; src2; dst } in
      (dst, src1_instructions @ src2_instructions @ [ instruction ])
  | Assignment (lhs, rhs) ->
      let result, ins_eval_result = convert_expr rhs e in
      let var, _ = convert_expr lhs e in
      let ins_copy_result = Copy { src = result; dst = var } in
      (var, ins_eval_result @ [ ins_copy_result ])
  | Conditional { cond_exp; then_exp; else_exp } ->
      let result = Var (declare_value "tmp" e) in
      let cond, cond_ins = convert_expr cond_exp e in
      let s_end = declare_label "cond_end" e in
      let s_e2 = declare_label "cond_e2" e in
      let jz_cond = JumpIfZero { condition = cond; target = s_e2 } in
      let v1, e1_ins = convert_expr then_exp e in
      let c1 = Copy { src = v1; dst = result } in
      let j_end = Jump { target = s_end } in
      let l_e2 = Label s_e2 in
      let v2, e2_ins = convert_expr else_exp e in
      let c2 = Copy { src = v2; dst = result } in
      let l_end = Label s_end in
      ( result,
        cond_ins @ [ jz_cond ] @ e1_ins @ [ c1; j_end; l_e2 ] @ e2_ins
        @ [ c2; l_end ] )

let rec convert_stmt (s : Ast.stmt) (e : Env.senv) : Ir.instruction list =
  match s with
  | Return v ->
      let value, instructions = convert_expr v e in
      instructions @ [ Return value ]
  | Expression v ->
      let _, instructions = convert_expr v e in
      instructions
  | If { cond_exp; then_smt; else_smt = None } ->
      let cond, cond_ins = convert_expr cond_exp e in
      let s_end = declare_label "if_end" e in
      let jz_cond = JumpIfZero { condition = cond; target = s_end } in
      let then_ins = convert_stmt then_smt e in
      let l_end = Label s_end in
      cond_ins @ [ jz_cond ] @ then_ins @ [ l_end ]
  | If { cond_exp; then_smt; else_smt = Some s } ->
      let cond, cond_ins = convert_expr cond_exp e in
      let s_end = declare_label "if_end" e in
      let s_else = declare_label "if_else" e in
      let jz_cond = JumpIfZero { condition = cond; target = s_else } in
      let then_ins = convert_stmt then_smt e in
      let j_end = Jump { target = s_end } in
      let l_else = Label s_else in
      let else_ins = convert_stmt s e in
      let l_end = Label s_end in
      cond_ins @ [ jz_cond ] @ then_ins @ [ j_end; l_else ] @ else_ins
      @ [ l_end ]
  | Compound b ->
      let (Block items) = b in
      List.map
        (fun node ->
          match node with S s -> convert_stmt s e | D d -> convert_dclr d e)
        items
      |> List.flatten
  | Goto (Identifier id) -> [ Jump { target = id } ]
  | Label (Identifier id, next_stmt) -> [ Label id ] @ convert_stmt next_stmt e
  | Null -> []

and convert_dclr (d : Ast.decl) (e : Env.senv) : Ir.instruction list =
  match d with
  (* No need to generate instructions for variable declaration *)
  | Declaration (lhs, None) ->
      insert_value lhs e;
      []
  (* Handle a declaration with initialiser as an assignment expression *)
  | Declaration (lhs, Some rhs) ->
      insert_value lhs e;
      let initialiser = Assignment (Ast.Var lhs, rhs) in
      let _, instructions = convert_expr initialiser e in
      instructions

and convert_func (f : Ast.func) (e : Env.senv) : Ir.func =
  match f with
  | Function fn ->
      let (Block block_items) = fn.body in
      let body =
        List.map
          (fun node ->
            match node with S s -> convert_stmt s e | D d -> convert_dclr d e)
          block_items
        |> List.flatten
      in
      (* Append "return 0" to the function end, in case no return present *)
      let body_safe_return = body @ [ Return (Constant 0) ] in
      Function { name = ident_to_string fn.name; body = body_safe_return }

let convert_prog (Program f : Ast.prog) (e : Env.senv) : Ir.prog =
  Program (convert_func f e)
