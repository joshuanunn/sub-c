open Asm

let emit_cond_code (o : cond_code) : string =
  match o with
  | E -> "e"
  | NE -> "ne"
  | G -> "g"
  | GE -> "ge"
  | L -> "l"
  | LE -> "le"

let emit_operand (o : operand) : string =
  match o with
  | Reg AL -> "%al"
  | Reg CL -> "%cl"
  | Reg DL -> "%dl"
  | Reg AX -> "%eax"
  | Reg CX -> "%ecx"
  | Reg DX -> "%edx"
  | Reg R10 -> "%r10d"
  | Reg R10B -> "%r10b"
  | Reg R11 -> "%r11d"
  | Reg R11B -> "%r11b"
  | Stack i -> Printf.sprintf "%d(%%rbp)" i
  | Imm i -> Printf.sprintf "$%d" i
  | Pseudo s -> failwith ("Pseudo operand " ^ s ^ " has not been lowered")

let emit_unary_op (o : unary_operator) : string =
  match o with BwNot -> "notl" | Neg -> "negl"

let emit_binary_op (o : binary_operator) : string =
  match o with
  | Add -> "addl"
  | Sub -> "subl"
  | Mult -> "imull"
  | BwAnd -> "andl"
  | BwXor -> "xorl"
  | BwOr -> "orl"

let emit_instruction (i : instruction) : string list =
  match i with
  | Mov { src; dst } ->
      let s = emit_operand src in
      let d = emit_operand dst in
      [ Printf.sprintf "\tmovl\t%s, %s" s d ]
  | Ret -> [ "\tmovq\t%rbp, %rsp"; "\tpopq\t%rbp"; "\tret" ]
  | Unary { uop; dst } ->
      let u = emit_unary_op uop in
      let d = emit_operand dst in
      [ Printf.sprintf "\t%s\t%s" u d ]
  | Binary { bop; src2; dst } ->
      let u = emit_binary_op bop in
      let s = emit_operand src2 in
      let d = emit_operand dst in
      [ Printf.sprintf "\t%s\t%s, %s" u s d ]
  | Cmp (op1, op2) ->
      let o1 = emit_operand op1 in
      let o2 = emit_operand op2 in
      [ Printf.sprintf "\tcmpl\t%s, %s" o1 o2 ]
  | Idiv o ->
      let d = emit_operand o in
      [ Printf.sprintf "\tidivl\t%s" d ]
  | Cdq -> [ "\tcdq" ]
  | Shl { src; dst } ->
      let s = emit_operand src in
      let d = emit_operand dst in
      [ Printf.sprintf "\tshll\t%s, %s" s d ]
  | Sar { src; dst } ->
      let s = emit_operand src in
      let d = emit_operand dst in
      [ Printf.sprintf "\tsarl\t%s, %s" s d ]
  | Jmp l -> [ Printf.sprintf "\tjmp  \t.L%s" l ]
  | JmpCC (c, l) ->
      let cc = emit_cond_code c in
      [ Printf.sprintf "\tj%-4s\t.L%s" cc l ]
  | SetCC (c, o) ->
      let cc = emit_cond_code c in
      let o1 = emit_operand o in
      [ Printf.sprintf "\tset%-2s\t%s" cc o1 ]
  | Label l -> [ Printf.sprintf ".L%s:" l ]
  | AllocateStack n -> [ Printf.sprintf "\tsubq\t$%d, %%rsp" n ]

let emit_func (f : func) : string list =
  match f with
  | Function fn ->
      let prologue =
        [
          Printf.sprintf "\t.globl\t%s" fn.name;
          Printf.sprintf "%s:" fn.name;
          "\tpushq\t%rbp";
          "\tmovq\t%rsp, %rbp";
        ]
      in
      let instructions =
        fn.instructions |> List.concat_map (fun instr -> emit_instruction instr)
      in
      prologue @ instructions

let emit_prog (Program p) : string =
  let footer = [ "\t.section\t.note.GNU-stack,\"\",@progbits\n" ] in
  String.concat "\n" (emit_func p @ footer)
