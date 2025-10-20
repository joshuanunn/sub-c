(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 24); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "cond_e2.4"));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Jmp "cond_end.3"); (Asm.Label "cond_e2.4");
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -12))); (Asm.Label "cond_end.3");
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.E, (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.JmpCC (Asm.E, "and_false.8"));
       (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.E, (Asm.Stack -20)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.JmpCC (Asm.E, "and_false.8"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24))); (Asm.Jmp "and_end.9");
       (Asm.Label "and_false.8"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.Label "and_end.9");
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
