(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R11)));
       Asm.Binary {op = Asm.Mult; src = (Asm.Stack -8);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Label "start.for.1"); (Asm.Mov ((Asm.Imm 100), (Asm.Stack -16)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -16)};
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.GE, (Asm.Stack -20)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.JmpCC (Asm.E, "break.for.1")); (Asm.Label "continue.for.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 3); dst = (Asm.Stack -24)};
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Jmp "start.for.1"); (Asm.Label "break.for.1");
       (Asm.Mov ((Asm.Imm 103), (Asm.Stack -28)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -28)};
       (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
       (Asm.SetCC (Asm.E, (Asm.Stack -32)));
       (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
