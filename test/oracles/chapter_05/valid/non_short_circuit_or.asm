(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.1"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "or_true.1"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "or_end.2");
       (Asm.Label "or_true.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Label "or_end.2"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
