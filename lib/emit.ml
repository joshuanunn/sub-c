open Asm

let emit_operand (o : operand) : string =
  match o with Register r -> "%" ^ r | Imm i -> Printf.sprintf "$%d" i

let emit_instruction (i : instruction) : string =
  match i with
  | Mov { src; dst } ->
      let s = emit_operand src in
      let d = emit_operand dst in
      Printf.sprintf "movl\t%s, %s" s d
  | Ret -> "ret"

let emit_func (f : func) : string list =
  match f with
  | Function fn ->
      let header =
        [ Printf.sprintf "\t.globl\t%s" fn.name; Printf.sprintf "%s:" fn.name ]
      in
      let instructions =
        List.map (fun instr -> "\t" ^ emit_instruction instr) fn.instructions
      in
      header @ instructions

let emit_prog (p : prog) : string =
  match p with
  | Program f ->
      let footer = [ "\t.section\t.note.GNU-stack,\"\",@progbits\n" ] in
      String.concat "\n" (emit_func f @ footer)
