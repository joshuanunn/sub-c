open Ast
open Env
open Ir

let ident_to_string = function Identifier s -> s

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
  (* Insert any AST Vars into IR Vars, as names are gaurunteed unique *)
  | Var (Identifier v) -> (Var (insert_value v e), [])
  | Unary { op : unop; exp : expr } ->
      let op = convert_unop op in
      let src, src_instructions = convert_expr exp e in
      let dst = Var (declare_value "tmp" e) in
      let instruction = Unary { op; src; dst } in
      (dst, src_instructions @ [ instruction ])
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

let convert_stmt (s : Ast.stmt) (e : Env.senv) : Ir.instruction list =
  match s with
  | Return v ->
      let value, instructions = convert_expr v e in
      instructions @ [ Return value ]
  | Expression v ->
      let _, instructions = convert_expr v e in
      instructions
  | Null -> []

let convert_dclr (d : Ast.decl) (e : Env.senv) : Ir.instruction list =
  match d with
  (* No need to generate instructions for variable declaration *)
  | Declaration (_, None) -> []
  (* Handle a declaration with initialiser as an assignment expression *)
  | Declaration (lhs, Some rhs) ->
      let initialiser = Assignment (Ast.Var lhs, rhs) in
      let _, instructions = convert_expr initialiser e in
      instructions

let convert_func (f : Ast.func) (e : Env.senv) : Ir.func =
  match f with
  | Function fn ->
      let body =
        List.map
          (fun node ->
            match node with S s -> convert_stmt s e | D d -> convert_dclr d e)
          fn.body
        |> List.flatten
      in
      (* Append "return 0" to the function end, in case no return present *)
      let body_safe_return = body @ [ Return (Constant 0) ] in
      Function { name = ident_to_string fn.name; body = body_safe_return }

let convert_prog (Program f : Ast.prog) (e : Env.senv) : Ir.prog =
  Program (convert_func f e)
