(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 80); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Stack -20);
          dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 14), (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.9"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.9"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32))); (Asm.Jmp "main.or.en.10");
        (Asm.Label "main.or.tr.9"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32)));
        (Asm.Label "main.or.en.10");
        (Asm.Mov ((Asm.Imm 14), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -36)};
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 16), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Imm 16), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Idiv (Asm.Stack -44));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.SetCC (Asm.E, (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "main.and.fl.19"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.SetCC (Asm.E, (Asm.Stack -56)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.JmpCC (Asm.E, "main.and.fl.19"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -60))); (Asm.Jmp "main.and.en.20");
        (Asm.Label "main.and.fl.19");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
        (Asm.Label "main.and.en.20");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -60)));
        (Asm.JmpCC (Asm.E, "main.and.fl.23"));
        (Asm.Cmp ((Asm.Imm 13), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.SetCC (Asm.E, (Asm.Stack -64)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.JmpCC (Asm.E, "main.and.fl.23"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -68))); (Asm.Jmp "main.and.en.24");
        (Asm.Label "main.and.fl.23");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.Label "main.and.en.24");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.JmpCC (Asm.E, "main.and.fl.27"));
        (Asm.Cmp ((Asm.Imm 16), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.SetCC (Asm.E, (Asm.Stack -72)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.JmpCC (Asm.E, "main.and.fl.27"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -76))); (Asm.Jmp "main.and.en.28");
        (Asm.Label "main.and.fl.27");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.Label "main.and.en.28");
        (Asm.Mov ((Asm.Stack -76), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 29;
        offset = -76;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          tmp.0  -> -12,
          tmp.3  -> -16,
          tmp.4  -> -20,
          tmp.7  -> -24,
          c.2    -> -28,
          tmp.8  -> -32,
          tmp.11 -> -36,
          d.3    -> -40,
          tmp.12 -> -44,
          tmp.15 -> -48,
          tmp.16 -> -52,
          tmp.17 -> -56,
          tmp.18 -> -60,
          tmp.21 -> -64,
          tmp.22 -> -68,
          tmp.25 -> -72,
          tmp.26 -> -76,
        }}}
     ])
