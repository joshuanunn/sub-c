(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 80); (Asm.Mov ((Asm.Imm 37), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 4); dst = (Asm.Stack -12)};
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.0"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.4"));
        (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.3"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.SetCC (Asm.E, (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.2"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.1")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.0"); (Asm.Label "loop.st.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -44)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -44)};
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "swit.cs.1.4");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -48)};
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "swit.cs.1.3");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -52)};
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "swit.cs.1.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -56)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -56)};
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "swit.cs.1.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -60)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -60)};
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "loop.ct.2");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -64)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -64)};
        (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.SetCC (Asm.G, (Asm.Stack -68)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.JmpCC (Asm.NE, "loop.st.2")); (Asm.Label "loop.br.2");
        (Asm.Label "swit.br.1"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.SetCC (Asm.E, (Asm.Stack -72)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.JmpCC (Asm.E, "and.fl.18"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.SetCC (Asm.E, (Asm.Stack -76)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.JmpCC (Asm.E, "and.fl.18"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -80))); (Asm.Jmp "and.en.19");
        (Asm.Label "and.fl.18"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.Label "and.en.19");
        (Asm.Mov ((Asm.Stack -80), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 20;
        offset = -80;
        stack slots = {
          count.0      -> -4,
          iterations.1 -> -8,
          tmp.0        -> -12,
          tmp.1        -> -16,
          tmp.2        -> -20,
          tmp.3        -> -24,
          tmp.4        -> -28,
          tmp.5        -> -32,
          tmp.6        -> -36,
          tmp.7        -> -40,
          tmp.8        -> -44,
          tmp.9        -> -48,
          tmp.10       -> -52,
          tmp.11       -> -56,
          tmp.12       -> -60,
          tmp.13       -> -64,
          tmp.14       -> -68,
          tmp.15       -> -72,
          tmp.16       -> -76,
          tmp.17       -> -80,
        }}}
     ])
