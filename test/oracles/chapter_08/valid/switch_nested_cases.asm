(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.0"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.1"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.3")); (Asm.Jmp "swit.df.1");
        (Asm.Label "swit.cs.1.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.cs.1.1"); (Asm.Jmp "if.en.3");
        (Asm.Label "swit.cs.1.3"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Jmp "swit.br.1"); (Asm.Label "if.en.3");
        (Asm.Label "swit.df.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.br.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "swit.cs.2.0"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.NE, "swit.cs.2.4")); (Asm.Jmp "swit.df.2");
        (Asm.Label "swit.cs.2.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Jmp "if.en.6"); (Asm.Label "if.el.7");
        (Asm.Label "swit.cs.2.4"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Jmp "swit.br.2"); (Asm.Label "if.en.6");
        (Asm.Label "swit.df.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.br.2");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.NE, "swit.cs.3.5")); (Asm.Jmp "swit.df.3");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40))); (Asm.Label "loop.st.4");
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.SetCC (Asm.L, (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "loop.br.4"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Label "swit.cs.3.5");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12))); (Asm.Jmp "loop.br.4");
        (Asm.Label "swit.df.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "loop.ct.4");
        (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -48)};
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        (Asm.Jmp "loop.st.4"); (Asm.Label "loop.br.4");
        (Asm.Label "swit.br.3"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "and.fl.12"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "and.fl.12"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -52))); (Asm.Jmp "and.en.13");
        (Asm.Label "and.fl.12"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.Label "and.en.13"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "and.fl.15"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "and.fl.15"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -56))); (Asm.Jmp "and.en.16");
        (Asm.Label "and.fl.15"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.Label "and.en.16");
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 17;
        offset = -56;
        stack slots = {
          switch1.0 -> -4,
          switch2.1 -> -8,
          switch3.2 -> -12,
          tmp.0     -> -16,
          tmp.1     -> -20,
          tmp.2     -> -24,
          tmp.4     -> -28,
          tmp.5     -> -32,
          tmp.8     -> -36,
          i.3       -> -40,
          tmp.9     -> -44,
          tmp.10    -> -48,
          tmp.11    -> -52,
          tmp.14    -> -56,
        }}}
     ])
