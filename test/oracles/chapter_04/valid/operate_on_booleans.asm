(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and_false.0"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and_false.0"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Jmp "and_end.1");
       (Asm.Label "and_false.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Label "and_end.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       Asm.Unary {uop = Asm.BwNot; dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "or_end.3");
       (Asm.Label "or_true.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
       (Asm.Label "or_end.3");
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       Asm.Unary {uop = Asm.Neg; dst = (Asm.Stack -16)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.Sub; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret]})
