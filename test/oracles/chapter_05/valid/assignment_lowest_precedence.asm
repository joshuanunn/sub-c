(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Jmp "or_end.3");
       (Asm.Label "or_true.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Label "or_end.3"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
