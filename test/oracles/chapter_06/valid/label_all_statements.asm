(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Label "label_if"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "if.el.1")); (Asm.Jmp "label_expression");
       (Asm.Jmp "if.en.0"); (Asm.Label "if.el.1"); (Asm.Jmp "label_empty");
       (Asm.Label "if.en.0"); (Asm.Label "label_goto");
       (Asm.Jmp "label_return"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "if.en.2")); (Asm.Label "label_expression");
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Label "if.en.2");
       (Asm.Jmp "label_if"); (Asm.Label "label_return");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Label "label_empty"); (Asm.Mov ((Asm.Imm 100), (Asm.Stack -4)));
       (Asm.Jmp "label_goto"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
       Asm.Ret]})
