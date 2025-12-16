(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Label "loop.st.1");
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.L, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.NE, "swit.cs.2.0"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.NE, "swit.cs.2.1"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "swit.cs.2.2")); (Asm.Jmp "swit.df.2");
        (Asm.Label "swit.cs.2.0"); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Jmp "swit.br.2"); (Asm.Label "swit.cs.2.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Imm 3); dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4))); (Asm.Jmp "swit.br.2");
        (Asm.Label "swit.cs.2.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Imm 4); dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4))); (Asm.Jmp "swit.br.2");
        (Asm.Label "swit.df.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -40)};
        (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "swit.br.2");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -44)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -44)};
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Label "loop.ct.1");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -48)};
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.SetCC (Asm.E, (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "and.fl.12"));
        (Asm.Cmp ((Asm.Imm 31), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.SetCC (Asm.E, (Asm.Stack -56)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.JmpCC (Asm.E, "and.fl.12"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -60))); (Asm.Jmp "and.en.13");
        (Asm.Label "and.fl.12"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
        (Asm.Label "and.en.13");
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 14;
        offset = -60;
        stack slots = {
          acc.0  -> -4,
          ctr.1  -> -8,
          i.2    -> -12,
          tmp.0  -> -16,
          tmp.1  -> -20,
          tmp.2  -> -24,
          tmp.3  -> -28,
          tmp.4  -> -32,
          tmp.5  -> -36,
          tmp.6  -> -40,
          tmp.7  -> -44,
          tmp.8  -> -48,
          tmp.9  -> -52,
          tmp.10 -> -56,
          tmp.11 -> -60,
        }}}
     ])
