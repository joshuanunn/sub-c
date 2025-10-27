(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 28); (Asm.Mov ((Asm.Imm 100), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Label "loop.st.1");
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 2); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       (Asm.Label "loop.ct.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -16)};
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "loop.st.1")); (Asm.Label "loop.br.1");
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.E, (Asm.Stack -20)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.JmpCC (Asm.E, "and.fl.5"));
       (Asm.Cmp ((Asm.Imm 200), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.SetCC (Asm.E, (Asm.Stack -24)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.JmpCC (Asm.E, "and.fl.5"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "and.en.6");
       (Asm.Label "and.fl.5"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.Label "and.en.6"); (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
