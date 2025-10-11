open Ir
open Asm

let compile_value (o : Ir.value) : Asm.operand =
  match o with Constant n -> Imm n | Var i -> Pseudo i

let compile_unary_operator (uop : Ir.unary_operator) : Asm.unary_operator =
  match uop with
  | BwNot -> BwNot
  | Negate -> Neg
  | _ -> failwith "Cannot compile IR unary operator to ASM unary"

let compile_binary_operator (bop : Ir.binary_operator) : Asm.binary_operator =
  match bop with
  | Add -> Add
  | Subtract -> Sub
  | Multiply -> Mult
  | BwAnd -> BwAnd
  | BwXor -> BwXor
  | BwOr -> BwOr
  | _ -> failwith "Cannot compile IR binary operator to ASM binary"

let compile_cond_code (bop : Ir.binary_operator) : Asm.cond_code =
  match bop with
  | Equal -> E
  | NotEqual -> NE
  | LessOrEqual -> LE
  | GreaterOrEqual -> GE
  | LessThan -> L
  | GreaterThan -> G
  | _ -> failwith "Cannot compile IR binary operator to ASM cond code"

let compile_instruction (s : Ir.instruction) : Asm.instruction list =
  match s with
  | Return v ->
      let ret = compile_value v in
      let mov = Mov (ret, Reg AX) in
      [ mov; Ret ]
  | Unary { op; src; dst } -> (
      let src_val = compile_value src in
      let dst_val = compile_value dst in
      match op with
      (* Logical Not operator *)
      | Not ->
          let cmp = Cmp (Imm 0, src_val) in
          let mov = Mov (Imm 0, dst_val) in
          let scc = SetCC (E, dst_val) in
          [ cmp; mov; scc ]
      (* Other unary operators *)
      | _ ->
          let op_val = compile_unary_operator op in
          let uin = Unary { op = op_val; dst = dst_val } in
          let mov = Mov (src_val, dst_val) in
          [ mov; uin ])
  | Binary { op; src1; src2; dst } -> (
      let src1_val = compile_value src1 in
      let src2_val = compile_value src2 in
      let dst_val = compile_value dst in
      match op with
      (* Division *)
      | Divide ->
          let mov1 = Mov (src1_val, Reg AX) in
          let idiv = Idiv src2_val in
          let mov2 = Mov (Reg AX, dst_val) in
          [ mov1; Cdq; idiv; mov2 ]
      | Remainder ->
          let mov1 = Mov (src1_val, Reg AX) in
          let idiv = Idiv src2_val in
          let mov2 = Mov (Reg DX, dst_val) in
          [ mov1; Cdq; idiv; mov2 ]
      (* Relational operators *)
      | Equal | NotEqual | LessOrEqual | GreaterOrEqual | LessThan | GreaterThan
        ->
          let cmp = Cmp (src2_val, src1_val) in
          let mov = Mov (Imm 0, dst_val) in
          let scc = SetCC (compile_cond_code op, dst_val) in
          [ cmp; mov; scc ]
      (* Bitwise left and right shifts *)
      | BwLeftShift -> (
          let mov1 = Mov (src1_val, dst_val) in
          match src2_val with
          (* special case: shift using an immediate operand *)
          | Imm _ ->
              let shl = Shl (src2_val, dst_val) in
              [ mov1; shl ]
          (* otherwise: shift using value in cl register *)
          | _ ->
              let mov2 = Mov (src2_val, Reg CX) in
              let shl = Shl (Reg CL, dst_val) in
              [ mov1; mov2; shl ])
      | BwRightShift -> (
          let mov1 = Mov (src1_val, dst_val) in
          match src2_val with
          (* special case: shift using an immediate operand *)
          | Imm _ ->
              let sar = Sar (src2_val, dst_val) in
              [ mov1; sar ]
          (* otherwise: shift using value in cl register *)
          | _ ->
              let mov2 = Mov (src2_val, Reg CX) in
              let sar = Sar (Reg CL, dst_val) in
              [ mov1; mov2; sar ])
      (* Everything else *)
      | Add | Subtract | Multiply | BwAnd | BwXor | BwOr ->
          let bin =
            Binary
              { op = compile_binary_operator op; src = src2_val; dst = dst_val }
          in
          let mov = Mov (src1_val, dst_val) in
          [ mov; bin ])
  | Jump { target } -> [ Jmp target ]
  | JumpIfZero { condition; target } ->
      [ Cmp (Imm 0, compile_value condition); JmpCC (E, target) ]
  | JumpIfNotZero { condition; target } ->
      [ Cmp (Imm 0, compile_value condition); JmpCC (NE, target) ]
  | Copy { src; dst } -> [ Mov (compile_value src, compile_value dst) ]
  | Label i -> [ Label i ]

let compile_func (f : Ir.func) : Asm.func =
  match f with
  | Function fn ->
      let instructions =
        List.map (fun instr -> compile_instruction instr) fn.body
        |> List.flatten
      in
      Function { name = fn.name; instructions }

let compile_prog (Program f : Ir.prog) : Asm.prog =
  let compiled_f = compile_func f in
  Program compiled_f
