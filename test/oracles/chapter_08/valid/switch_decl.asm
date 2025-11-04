(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.SetCC (Asm.E, (Asm.Stack -12)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.NE, "swit.cs.1.3")); (Asm.Jmp "swit.br.1");
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       (Asm.Label "swit.cs.1.3"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Label "swit.br.1"); (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.SetCC (Asm.E, (Asm.Stack -24)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.JmpCC (Asm.E, "and.fl.5"));
       (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.SetCC (Asm.E, (Asm.Stack -28)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.JmpCC (Asm.E, "and.fl.5"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32))); (Asm.Jmp "and.en.6");
       (Asm.Label "and.fl.5"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
       (Asm.Label "and.en.6"); (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
