(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "cond_e2.3"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "cond_end.2");
       (Asm.Label "cond_e2.3"); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       (Asm.Label "cond_end.2");
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
