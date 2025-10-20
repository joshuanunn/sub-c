(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "or_end.3");
       (Asm.Label "or_true.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Label "or_end.3"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.JmpCC (Asm.E, "cond_e2.5")); (Asm.Jmp "cond_end.4");
       (Asm.Label "cond_e2.5"); (Asm.Label "cond_end.4");
       (Asm.Mov ((Asm.Imm 20), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
