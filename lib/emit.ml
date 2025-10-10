open Asm

let emit_cc (o : cond_code) : string =
  match o with
  | E -> "e"
  | NE -> "ne"
  | G -> "g"
  | GE -> "ge"
  | L -> "l"
  | LE -> "le"

let emit_op (o : operand) : string =
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

let format_instruction (i : string) (o : string) : string =
  let ins = Printf.sprintf "    %s" i in
  Printf.sprintf "%-16s%s" ins o

let format_label (l : string) : string = Printf.sprintf ".L%s:" l
let format_function (f : string) : string = Printf.sprintf "%s:" f

let emit_instruction (i : instruction) : string list =
  match i with
  | Mov { src; dst } ->
      let ops = Printf.sprintf "%s, %s" (emit_op src) (emit_op dst) in
      [ format_instruction "movl" ops ]
  | Ret ->
      [
        format_instruction "movq" "%rbp, %rsp";
        format_instruction "popq" "%rbp";
        format_instruction "ret" "";
      ]
  | Unary { uop; dst } ->
      [ format_instruction (emit_unary_op uop) (emit_op dst) ]
  | Binary { bop; src2; dst } ->
      let ops = Printf.sprintf "%s, %s" (emit_op src2) (emit_op dst) in
      [ format_instruction (emit_binary_op bop) ops ]
  | Cmp (op1, op2) ->
      let ops = Printf.sprintf "%s, %s" (emit_op op1) (emit_op op2) in
      [ format_instruction "cmpl" ops ]
  | Idiv o -> [ format_instruction "idivl" (emit_op o) ]
  | Cdq -> [ format_instruction "cdq" "" ]
  | Shl { src; dst } ->
      let ops = Printf.sprintf "%s, %s" (emit_op src) (emit_op dst) in
      [ format_instruction "shll" ops ]
  | Sar { src; dst } ->
      let ops = Printf.sprintf "%s, %s" (emit_op src) (emit_op dst) in
      [ format_instruction "sarl" ops ]
  | Jmp l ->
      let ops = Printf.sprintf ".L%s" l in
      [ format_instruction "jmp" ops ]
  | JmpCC (c, l) ->
      let ins = Printf.sprintf "j%s" (emit_cc c) in
      let ops = Printf.sprintf ".L%s" l in
      [ format_instruction ins ops ]
  | SetCC (c, o) ->
      let ins = Printf.sprintf "set%s" (emit_cc c) in
      let ops = Printf.sprintf "%s" (emit_op o) in
      [ format_instruction ins ops ]
  | Label l -> [ format_label l ]
  | AllocateStack n ->
      let ops = Printf.sprintf "$%d, %%rsp" n in
      [ format_instruction "subq" ops ]

let emit_func (f : func) : string list =
  match f with
  | Function fn ->
      let prologue =
        [
          format_instruction ".globl" fn.name;
          format_function fn.name;
          format_instruction "pushq" "%rbp";
          format_instruction "movq" "%rsp, %rbp";
        ]
      in
      let instructions =
        fn.instructions |> List.concat_map (fun instr -> emit_instruction instr)
      in
      prologue @ instructions

let emit_prog (Program p) : string =
  let footer =
    [ format_instruction ".section" ".note.GNU-stack,\"\",@progbits\n" ]
  in
  String.concat "\n" (emit_func p @ footer)
