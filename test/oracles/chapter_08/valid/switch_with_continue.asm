(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.0"));
        (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.4")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.cs.1.4");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16))); (Asm.Label "loop.st.2");
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.L, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "loop.br.2"));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "if.en.4")); (Asm.Jmp "loop.ct.2");
        (Asm.Label "if.en.4");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -28)};
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Label "loop.ct.2");
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -32)};
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Jmp "loop.st.2"); (Asm.Label "loop.br.2");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.br.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 7;
        offset = -32;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          acc.0 -> -12,
          i.1   -> -16,
          tmp.2 -> -20,
          tmp.3 -> -24,
          tmp.5 -> -28,
          tmp.6 -> -32,
        }}}
     ])
