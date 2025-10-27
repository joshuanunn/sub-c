(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
       (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.E, (Asm.Stack -20)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.JmpCC (Asm.E, "and.fl.6"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -24)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -24)};
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.SetCC (Asm.E, (Asm.Stack -28)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.JmpCC (Asm.E, "and.fl.6"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32))); (Asm.Jmp "and.en.7");
       (Asm.Label "and.fl.6"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
       (Asm.Label "and.en.7"); (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
