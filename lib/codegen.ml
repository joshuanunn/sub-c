open Ir
open Asm

let compile_val (o : Ir.value) : Asm.operand =
  match o with Constant n -> Imm n | Var i -> Pseudo i

let compile_unary_op (uop : Ir.unary_operator) : Asm.unary_operator =
  match uop with
  | BwNot -> BwNot
  | Negate -> Neg
  | _ -> failwith "Cannot compile IR unary operator to ASM unary"

let compile_binary_op (bop : Ir.binary_operator) : Asm.binary_operator =
  match bop with
  | Add -> Add
  | Subtract -> Sub
  | Multiply -> Mult
  | BwAnd -> BwAnd
  | BwXor -> BwXor
  | BwOr -> BwOr
  | _ -> failwith "Cannot compile IR binary operator to ASM binary"

let compile_cc (bop : Ir.binary_operator) : Asm.cond_code =
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
  | Return v -> [ Mov (compile_val v, Reg AX); Ret ]
  | Unary { op; src; dst } -> (
      let src_val = compile_val src in
      let dst_val = compile_val dst in
      match op with
      (* Logical Not operator *)
      | Not ->
          [ Cmp (Imm 0, src_val); Mov (Imm 0, dst_val); SetCC (E, dst_val) ]
      (* Other unary operators *)
      | _ ->
          [
            Mov (src_val, dst_val);
            Unary { op = compile_unary_op op; dst = dst_val };
          ])
  | Binary { op; src1; src2; dst } -> (
      let src1_val = compile_val src1 in
      let src2_val = compile_val src2 in
      let dst_val = compile_val dst in
      match op with
      (* Division *)
      | Divide ->
          [ Mov (src1_val, Reg AX); Cdq; Idiv src2_val; Mov (Reg AX, dst_val) ]
      | Remainder ->
          [ Mov (src1_val, Reg AX); Cdq; Idiv src2_val; Mov (Reg DX, dst_val) ]
      (* Relational operators *)
      | Equal | NotEqual | LessOrEqual | GreaterOrEqual | LessThan | GreaterThan
        ->
          [
            Cmp (src2_val, src1_val);
            Mov (Imm 0, dst_val);
            SetCC (compile_cc op, dst_val);
          ]
      (* Bitwise left and right shifts *)
      | BwLeftShift -> (
          match src2_val with
          (* special case: shift using an immediate operand *)
          | Imm _ -> [ Mov (src1_val, dst_val); Shl (src2_val, dst_val) ]
          (* otherwise: shift using value in cl register *)
          | _ ->
              [
                Mov (src1_val, dst_val);
                Mov (src2_val, Reg CX);
                Shl (Reg CL, dst_val);
              ])
      | BwRightShift -> (
          match src2_val with
          (* special case: shift using an immediate operand *)
          | Imm _ -> [ Mov (src1_val, dst_val); Sar (src2_val, dst_val) ]
          (* otherwise: shift using value in cl register *)
          | _ ->
              [
                Mov (src1_val, dst_val);
                Mov (src2_val, Reg CX);
                Sar (Reg CL, dst_val);
              ])
      (* Everything else *)
      | Add | Subtract | Multiply | BwAnd | BwXor | BwOr ->
          let maybe_mov =
            if src1_val = dst_val then [] else [ Mov (src1_val, dst_val) ]
          in
          maybe_mov
          @ [
              Binary
                { op = compile_binary_op op; src = src2_val; dst = dst_val };
            ])
  | Jump { target } -> [ Jmp target ]
  | JumpIfZero { condition; target } ->
      [ Cmp (Imm 0, compile_val condition); JmpCC (E, target) ]
  | JumpIfNotZero { condition; target } ->
      [ Cmp (Imm 0, compile_val condition); JmpCC (NE, target) ]
  | Copy { src; dst } -> [ Mov (compile_val src, compile_val dst) ]
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
