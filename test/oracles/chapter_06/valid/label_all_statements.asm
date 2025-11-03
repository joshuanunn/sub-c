(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Label "label_if.0"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "if.el.1")); (Asm.Jmp "label_expression.2");
       (Asm.Jmp "if.en.0"); (Asm.Label "if.el.1"); (Asm.Jmp "label_empty.4");
       (Asm.Label "if.en.0"); (Asm.Label "label_goto.1");
       (Asm.Jmp "label_return.3");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "if.en.2")); (Asm.Label "label_expression.2");
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Label "if.en.2");
       (Asm.Jmp "label_if.0"); (Asm.Label "label_return.3");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Label "label_empty.4");
       (Asm.Mov ((Asm.Imm 100), (Asm.Stack -4))); (Asm.Jmp "label_goto.1");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
