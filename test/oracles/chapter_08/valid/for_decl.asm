(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 24); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 100), (Asm.Stack -12)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Label "start.for.1"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.LE, (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.JmpCC (Asm.E, "break.for.1"));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Label "continue.for.1");
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -24)};
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Jmp "start.for.1"); (Asm.Label "break.for.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
