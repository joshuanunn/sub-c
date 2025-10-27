(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "or.tr.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or.tr.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "or.en.3");
       (Asm.Label "or.tr.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
       (Asm.Label "or.en.3"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.E, "cond.el.5"));
       (Asm.Mov ((Asm.Imm 20), (Asm.Stack -8))); (Asm.Jmp "cond.en.4");
       (Asm.Label "cond.el.5"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Label "cond.en.4"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
