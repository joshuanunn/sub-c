(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "cond_e2.3"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "cond_e2.5")); (Asm.Jmp "cond_end.4");
       (Asm.Label "cond_e2.5"); (Asm.Label "cond_end.4");
       (Asm.Jmp "cond_end.2"); (Asm.Label "cond_e2.3");
       (Asm.Label "cond_end.2"); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "cond_e2.7"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "cond_e2.9")); (Asm.Jmp "cond_end.8");
       (Asm.Label "cond_e2.9"); (Asm.Label "cond_end.8");
       (Asm.Jmp "cond_end.6"); (Asm.Label "cond_e2.7");
       (Asm.Label "cond_end.6"); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R11)));
       Asm.Binary {op = Asm.Mult; src = (Asm.Stack -8);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
