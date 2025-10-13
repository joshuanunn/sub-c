(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 36); (Asm.Mov ((Asm.Imm 2593), (Asm.Stack -4)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.AX))); Asm.Cdq;
       (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -28)};
       (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
       (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.AX))); Asm.Ret]})
