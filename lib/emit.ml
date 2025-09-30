open Asm

let emit_operand (o : operand) : string =
  match o with
  | Reg AX -> "%eax"
  | Reg DX -> "%edx"
  | Reg R10 -> "%r10d"
  | Reg R11 -> "%r11d"
  | Stack i -> Printf.sprintf "%d(%%rbp)" i
  | Imm i -> Printf.sprintf "$%d" i
  | Pseudo s -> failwith ("Pseudo operand " ^ s ^ " has not been lowered")

let emit_unary_op (o : unary_operator) : string =
  match o with Neg -> "negl" | Not -> "notl"

let emit_binary_op (o : binary_operator) : string =
  match o with Add -> "addl" | Sub -> "subl" | Mult -> "imull"

let emit_instruction (i : instruction) : string list =
  match i with
  | Mov { src; dst } ->
      let s = emit_operand src in
      let d = emit_operand dst in
      [ Printf.sprintf "movl\t%s, %s" s d ]
  | Ret -> [ "movq\t%rbp, %rsp"; "popq\t%rbp"; "ret" ]
  | Unary { uop; dst } ->
      let u = emit_unary_op uop in
      let d = emit_operand dst in
      [ Printf.sprintf "%s\t%s" u d ]
  | Binary { bop; src2; dst } ->
      let u = emit_binary_op bop in
      let s = emit_operand src2 in
      let d = emit_operand dst in
      [ Printf.sprintf "%s\t%s, %s" u s d ]
  | Idiv o ->
      let d = emit_operand o in
      [ Printf.sprintf "idivl\t%s" d ]
  | Cdq -> [ "cdq" ]
  | AllocateStack n -> [ Printf.sprintf "subq\t$%d, %%rsp" n ]

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
        fn.instructions
        |> List.concat_map (fun instr -> emit_instruction instr)
        |> List.map (fun instr -> "\t" ^ instr)
      in
      prologue @ instructions

let emit_prog (Program p) : string =
  let footer = [ "\t.section\t.note.GNU-stack,\"\",@progbits\n" ] in
  String.concat "\n" (emit_func p @ footer)
