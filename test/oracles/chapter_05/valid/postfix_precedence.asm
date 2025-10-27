(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 28); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.E, (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.E, (Asm.Stack -20)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.JmpCC (Asm.E, "and.fl.5"));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.SetCC (Asm.E, (Asm.Stack -24)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.JmpCC (Asm.E, "and.fl.5"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "and.en.6");
       (Asm.Label "and.fl.5"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.Label "and.en.6"); (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
