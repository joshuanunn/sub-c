open Ast
open Env
open Ir

let convert_unop (u : Ast.unop) : Ir.unary_operator =
  match u with BwNot -> BwNot | Negate -> Negate | Not -> Not

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
  | _ -> failwith "Cannot compile AST binary operator to IR binary"

let rec convert_expr (v : Ast.expr) (e : Env.senv) :
    Ir.value * Ir.instruction list =
  match v with
  | LiteralInt n -> (Constant n, [])
  | Unary { op : unop; exp : expr } ->
      let op = convert_unop op in
      let src, src_instructions = convert_expr exp e in
      let dst = Var (alloc_senv_value e "tmp") in
      let instruction = Unary { op; src; dst } in
      (dst, src_instructions @ [ instruction ])
  | Binary { op = And; left : expr; right : expr } ->
      let lhs, lhs_ins = convert_expr left e in
      let rhs, rhs_ins = convert_expr right e in
      let dst = Var (alloc_senv_value e "tmp") in
      let lbs = alloc_senv_label e "and_false" in
      let lbe = alloc_senv_label e "and_end" in
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
      let dst = Var (alloc_senv_value e "tmp") in
      let lbs = alloc_senv_label e "or_true" in
      let lbe = alloc_senv_label e "or_end" in
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
      let dst = Var (alloc_senv_value e "tmp") in
      let instruction = Binary { op; src1; src2; dst } in
      (dst, src1_instructions @ src2_instructions @ [ instruction ])

let convert_stmt (s : Ast.stmt) (e : Env.senv) : Ir.instruction list =
  match s with
  | Return v ->
      let value, instructions = convert_expr v e in
      instructions @ [ Return value ]

let convert_func (f : Ast.func) (e : Env.senv) : Ir.func =
  match f with
  | Function fn ->
      let body = convert_stmt fn.body e in
      Function { name = fn.name; body }

let convert_prog (Program f : Ast.prog) : Ir.prog * Env.senv =
  (* Initialise a new environment *)
  let e = Env.make_senv () in
  let compiled_f = convert_func f e in
  (Program compiled_f, e)
