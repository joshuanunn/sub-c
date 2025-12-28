(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -16)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "and.fl.6"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.SetCC (Asm.E, (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "and.fl.6"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -40))); (Asm.Jmp "and.en.7");
        (Asm.Label "and.fl.6"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.Label "and.en.7"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Mov ((Asm.Imm -2), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.SetCC (Asm.E, (Asm.Stack -48)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -52))); (Asm.Jmp "and.en.12");
        (Asm.Label "and.fl.11"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.Label "and.en.12"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "and.fl.15"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.SetCC (Asm.E, (Asm.Stack -56)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.JmpCC (Asm.E, "and.fl.15"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -60))); (Asm.Jmp "and.en.16");
        (Asm.Label "and.fl.15"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
        (Asm.Label "and.en.16");
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 17;
        offset = -60;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          tmp.0  -> -16,
          d.3    -> -20,
          tmp.1  -> -24,
          tmp.2  -> -28,
          tmp.3  -> -32,
          tmp.4  -> -36,
          tmp.5  -> -40,
          tmp.8  -> -44,
          tmp.9  -> -48,
          tmp.10 -> -52,
          tmp.13 -> -56,
          tmp.14 -> -60,
        }}}
     ])
