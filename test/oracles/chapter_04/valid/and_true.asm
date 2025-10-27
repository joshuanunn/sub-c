(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and.fl.2"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -4)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "and.fl.2"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "and.en.3");
       (Asm.Label "and.fl.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Label "and.en.3"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
