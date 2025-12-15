let compile_val (o : Ir.value) : Asm.operand =
  match o with Constant n -> Imm n | Var i -> Pseudo i

let split_at n lst =
  let rec aux i acc l =
    match (i, l) with
    | 0, _ -> (List.rev acc, l)
    | _, [] -> (List.rev acc, [])
    | i, x :: xs -> aux (i - 1) (x :: acc) xs
  in
  aux n [] lst

let rec copy_args_to_regs regs args =
  match (regs, args) with
  | r :: regs', a :: args' ->
      let instr = Asm.Mov (compile_val a, Reg r) in
      instr :: copy_args_to_regs regs' args'
  | _ -> [] (* stop when either list is exhausted *)

(** [build_stack_pushes stack_args] generates the list of assembly instructions
    to push stack-passed arguments for a function call, following System V ABI.

    The incoming [stack_args] list is ordered left-to-right as written, but the
    System V ABI requires that the stack arguments be pushed right-to-left, i.e.
    the last stack argument is pushed first.

    For each argument:
    - If already a register or immediate, simply emit: push <arg>
    - Otherwise, ABI requires register push, so emit: mov <arg>, %ax push %ax *)
let build_stack_pushes args =
  let reversed = List.rev args in
  List.flatten
    (List.map
       (fun a ->
         let op = compile_val a in
         match op with
         | Reg _ | Imm _ -> [ Asm.Push op ]
         | _ -> [ Asm.Mov (op, Reg AX); Asm.Push (Reg AX) ])
       reversed)

(** Use System V calling convention to generate instructions to copy parameters
    on to the local stack to simplify handling. This is done by moving Reg(DI)
    into a pseudoregister for the first parameter, the second from Reg(SI), etc
    up to the sixth parameter. Any further parameters are copied in steps of 8
    bytes from Stack(16), Stack(24), etc. The System V calling convention is
    show in the table below.

    {v
          | Arg index | Location defined by caller |
          | --------- | -------------------------- |
          | 0         | %edi                       |
          | 1         | %esi                       |
          | 2         | %edx                       |
          | 3         | %ecx                       |
          | 4         | %r8d                       |
          | 5         | %r9d                       |
          | 6         | 16(%rbp)                   |
          | 7         | 24(%rbp)                   |
          | 8         | 32(%rbp)                   |
          | …         | (16 + 8*(i-6))(%rbp)       |
    v}

    The full stack layout after prologue, local allocation, and copying
    parameters into local slots will look something like:

    {v
                            Higher addresses
          +------------------------------------------+-----------+
          | arg 8 (9th argument)                     |  32(%rbp) |
          +------------------------------------------+-----------+
          | arg 7 (8th argument)                     |  24(%rbp) |
          +------------------------------------------+-----------+
          | arg 6 (7th argument)                     |  16(%rbp) |
          +------------------------------------------+-----------+
          | return address                           |   8(%rbp) |
          +------------------------------------------+-----------+
          | old %rbp                                 |   0(%rbp) |
    rbp → +------------------------------------------+-----------+
          | Var 0 local slot (copied from %edi)      |  -4(%rbp) |
          +------------------------------------------+-----------+
          | Var 1 local slot (copied from %esi)      |  -8(%rbp) |
          +------------------------------------------+-----------+
          | Var 2 local slot (copied from %edx)      | -12(%rbp) |
          +------------------------------------------+-----------+
          | Var 3 local slot (copied from %ecx)      | -16(%rbp) |
          +------------------------------------------+-----------+
          | Var 4 local slot (copied from %r8d)      | -20(%rbp) |
          +------------------------------------------+-----------+
          | Var 5 local slot (copied from %r9d)      | -24(%rbp) |
          +------------------------------------------+-----------+
          | Var 6 local slot (copied from 16(%rbp))  | -28(%rbp) |
          +------------------------------------------+-----------+
          | Var 7 local slot (copied from 24(%rbp))  | -32(%rbp) |
          +------------------------------------------+-----------+
          | Var 8 local slot (copied from 32(%rbp))  | -36(%rbp) |
          +------------------------------------------------------+
          |      ... more locals / temps ...                     |
          +------------------------------------------------------+
    rsp → |   bottom of frame after subq $locals, %rsp           |
          +------------------------------------------------------+
                            Lower addresses
    v}
    **)
let copy_args_to_stack (params : string list) : Asm.instruction list =
  let reg_order = [ Asm.DI; Asm.SI; Asm.DX; Asm.CX; Asm.R8; Asm.R9 ] in

  let rec build i params acc =
    match params with
    | [] -> List.rev acc
    | param :: rest ->
        let dst = Asm.Pseudo param in
        let instr =
          if i < 6 then
            (* Copy first 6 params from registers to new stack slot *)
            Asm.Mov (Reg (List.nth reg_order i), dst)
          else
            (* Copy further params from caller stack -> new stack slot *)
            let offset = 16 + (8 * (i - 6)) in
            Asm.Mov (Asm.Stack offset, dst)
        in
        build (i + 1) rest (instr :: acc)
  in
  build 0 params []

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
                Shl (Reg CX, dst_val);
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
                Sar (Reg CX, dst_val);
              ])
      (* Everything else *)
      | Add | Subtract | Multiply | BwAnd | BwXor | BwOr ->
          let maybe_mov =
            if src1_val = dst_val then [] else [ Asm.Mov (src1_val, dst_val) ]
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
  | FunCall { fun_name; args; dst } ->
      (* Adjust stack alignment by padding with 8 bytes if odd number of args *)
      let register_args, stack_args = split_at 6 args in
      let odd_stack = List.length stack_args mod 2 = 1 in
      let stack_padding = if odd_stack then 8 else 0 in
      let pad_stack =
        if odd_stack then [ Asm.AllocateStack stack_padding ] else []
      in
      (* Pass args in registers *)
      let reg_order = [ Asm.DI; Asm.SI; Asm.DX; Asm.CX; Asm.R8; Asm.R9 ] in
      let pass_register_args = copy_args_to_regs reg_order register_args in
      (* Pass remaining args on stack *)
      let pass_stack_args = build_stack_pushes stack_args in
      (* Emit function call *)
      let emit_call = [ Asm.Call fun_name ] in
      (* Adjust stack pointer *)
      let adj_bytes = (8 * List.length stack_args) + stack_padding in
      let dealloc_stack =
        if adj_bytes != 0 then [ Asm.DeallocateStack adj_bytes ] else []
      in
      (* Retrieve return value *)
      let ret_value = [ Asm.Mov (Reg AX, compile_val dst) ] in
      pad_stack @ pass_register_args @ pass_stack_args @ emit_call
      @ dealloc_stack @ ret_value

let compile_func (f : Ir.top_level) : Asm.func =
  match f with
  | Function fn ->
      let args_ins = copy_args_to_stack fn.params in
      let body_ins = List.map compile_instruction fn.body |> List.flatten in
      let instructions = args_ins @ body_ins in
      (* let stack_size = 4 * List.length fn.params in *)
      Function { name = fn.name; instructions; frame = fn.frame }
  | _ -> failwith "TODO"

let compile_prog (Program p : Ir.prog) : Asm.prog =
  let compiled_funcs = List.map (function f -> compile_func f) p in
  Asm.Program compiled_funcs
