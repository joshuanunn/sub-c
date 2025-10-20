(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.G, (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.JmpCC (Asm.E, "cond_e2.5")); (Asm.Jmp "cond_end.4");
       (Asm.Label "cond_e2.5"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.E, "cond_e2.7")); (Asm.Jmp "cond_end.6");
       (Asm.Label "cond_e2.7"); (Asm.Label "cond_end.6");
       (Asm.Label "cond_end.4"); (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
