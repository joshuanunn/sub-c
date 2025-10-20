(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "if_else.3"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Jmp "if_end.2"); (Asm.Label "if_else.3");
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "if_end.4"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Label "if_end.4"); (Asm.Label "if_end.2");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
