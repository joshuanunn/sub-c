(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.5"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and_false.2"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Cdq;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "and_false.2"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "and_end.3");
       (Asm.Label "and_false.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Label "and_end.3"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.JmpCC (Asm.NE, "or_true.5"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "or_end.6");
       (Asm.Label "or_true.5"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
       (Asm.Label "or_end.6"); (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
