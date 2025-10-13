(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "or_end.3");
       (Asm.Label "or_true.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
       (Asm.Label "or_end.3"); (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
