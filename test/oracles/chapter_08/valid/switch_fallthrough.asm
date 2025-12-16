(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 9), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "cond.el.2"));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Jmp "cond.en.1"); (Asm.Label "cond.el.2");
        (Asm.Mov ((Asm.Imm 7), (Asm.Stack -16))); (Asm.Label "cond.en.1");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.0"));
        (Asm.Cmp ((Asm.Imm 7), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.7"));
        (Asm.Cmp ((Asm.Imm 9), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.9"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.1")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.0"); (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.cs.1.7");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12))); (Asm.Label "swit.cs.1.9");
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -12))); (Asm.Label "swit.cs.1.1");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 4); dst = (Asm.Stack -36)};
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Label "swit.br.1");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 8;
        offset = -36;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          c.2   -> -12,
          tmp.0 -> -16,
          tmp.3 -> -20,
          tmp.4 -> -24,
          tmp.5 -> -28,
          tmp.6 -> -32,
          tmp.7 -> -36,
        }}}
     ])
