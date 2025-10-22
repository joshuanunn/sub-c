(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "if_else.1"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "if_end.0");
       (Asm.Label "if_else.1");
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Unary {op = Asm.BwNot; dst = (Asm.Stack -12)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.E, "if_end.3"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8))); (Asm.Label "if_end.3");
       (Asm.Label "if_end.0"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
