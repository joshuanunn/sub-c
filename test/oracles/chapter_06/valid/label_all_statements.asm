(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Label "label_if.1"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "if_else.1")); (Asm.Jmp "label_expression.3");
       (Asm.Jmp "if_end.0"); (Asm.Label "if_else.1");
       (Asm.Jmp "label_empty.5"); (Asm.Label "if_end.0");
       (Asm.Label "label_goto.2"); (Asm.Jmp "label_return.4");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "if_end.2")); (Asm.Label "label_expression.3");
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Label "if_end.2");
       (Asm.Jmp "label_if.1"); (Asm.Label "label_return.4");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Label "label_empty.5");
       (Asm.Mov ((Asm.Imm 100), (Asm.Stack -4))); (Asm.Jmp "label_goto.2");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
