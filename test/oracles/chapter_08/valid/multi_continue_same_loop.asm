(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Label "loop.st.1");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -16)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.LE, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "main.if.en.2")); (Asm.Jmp "loop.ct.1");
        (Asm.Label "main.if.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -24)};
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.SetCC (Asm.GE, (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "main.if.en.5")); (Asm.Jmp "loop.ct.1");
        (Asm.Label "main.if.en.5");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -32)};
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Label "loop.ct.1"); (Asm.Cmp ((Asm.Imm 50), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.NE, "loop.st.1")); (Asm.Label "loop.br.1");
        (Asm.Cmp ((Asm.Imm 50), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "main.and.fl.11"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.SetCC (Asm.E, (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "main.and.fl.11"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -48))); (Asm.Jmp "main.and.en.12");
        (Asm.Label "main.and.fl.11");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.Label "main.and.en.12");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.JmpCC (Asm.E, "main.and.fl.15"));
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.SetCC (Asm.E, (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "main.and.fl.15"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -56))); (Asm.Jmp "main.and.en.16");
        (Asm.Label "main.and.fl.15");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.Label "main.and.en.16");
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 17;
        offset = -56;
        stack slots = {
          x.0    -> -4,
          y.1    -> -8,
          z.2    -> -12,
          tmp.0  -> -16,
          tmp.1  -> -20,
          tmp.3  -> -24,
          tmp.4  -> -28,
          tmp.6  -> -32,
          tmp.7  -> -36,
          tmp.8  -> -40,
          tmp.9  -> -44,
          tmp.10 -> -48,
          tmp.13 -> -52,
          tmp.14 -> -56,
        }}}
     ])
