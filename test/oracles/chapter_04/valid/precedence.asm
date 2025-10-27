(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or.tr.4"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and.fl.1"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and.fl.1"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Jmp "and.en.2");
       (Asm.Label "and.fl.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Label "and.en.2"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "or.tr.4"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "or.en.5");
       (Asm.Label "or.tr.4"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Label "or.en.5"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
