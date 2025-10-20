(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "cond_e2.1")); (Asm.Jmp "cond_end.0");
       (Asm.Label "cond_e2.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.3"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.3"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Jmp "or_end.4");
       (Asm.Label "or_true.3"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Label "or_end.4"); (Asm.Label "cond_end.0");
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
