(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 32);
       (Asm.Mov ((Asm.Imm 2147483647), (Asm.Stack -8)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Label "loop.st.1"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX)));
       Asm.Cdq; (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -12)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.JmpCC (Asm.E, "loop.br.1"));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Label "loop.ct.1"); (Asm.Jmp "loop.st.1");
       (Asm.Label "loop.br.1"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX)));
       Asm.Cdq; (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -24)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
       (Asm.JmpCC (Asm.NE, "or.tr.7"));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.SetCC (Asm.G, (Asm.Stack -28)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.JmpCC (Asm.NE, "or.tr.7"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32))); (Asm.Jmp "or.en.8");
       (Asm.Label "or.tr.7"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32)));
       (Asm.Label "or.en.8"); (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
