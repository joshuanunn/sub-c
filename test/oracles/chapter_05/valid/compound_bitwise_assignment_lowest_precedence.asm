(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Imm 11), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.1"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "main.or.en.2");
        (Asm.Label "main.or.tr.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "main.or.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwAnd; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -16)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.5")); (Asm.Jmp "main.or.tr.5");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20))); (Asm.Jmp "main.or.en.6");
        (Asm.Label "main.or.tr.5"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20)));
        (Asm.Label "main.or.en.6");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwXor; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 14), (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.9"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.9"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32))); (Asm.Jmp "main.or.en.10");
        (Asm.Label "main.or.tr.9"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32)));
        (Asm.Label "main.or.en.10");
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwOr; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -36)};
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 16), (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.13"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.13"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44))); (Asm.Jmp "main.or.en.14");
        (Asm.Label "main.or.tr.13");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44)));
        (Asm.Label "main.or.en.14");
        (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.CX)));
        (Asm.Sar ((Asm.Reg Asm.CX), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 18), (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.17"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.17"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56))); (Asm.Jmp "main.or.en.18");
        (Asm.Label "main.or.tr.17");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -56)));
        (Asm.Label "main.or.en.18");
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.CX)));
        (Asm.Shl ((Asm.Reg Asm.CX), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.SetCC (Asm.E, (Asm.Stack -64)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.JmpCC (Asm.E, "main.and.fl.23"));
        (Asm.Cmp ((Asm.Imm 13), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.SetCC (Asm.E, (Asm.Stack -68)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.JmpCC (Asm.E, "main.and.fl.23"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -72))); (Asm.Jmp "main.and.en.24");
        (Asm.Label "main.and.fl.23");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.Label "main.and.en.24");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.JmpCC (Asm.E, "main.and.fl.27"));
        (Asm.Cmp ((Asm.Imm 15), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.SetCC (Asm.E, (Asm.Stack -76)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.JmpCC (Asm.E, "main.and.fl.27"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -80))); (Asm.Jmp "main.and.en.28");
        (Asm.Label "main.and.fl.27");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.Label "main.and.en.28");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.JmpCC (Asm.E, "main.and.fl.31"));
        (Asm.Cmp ((Asm.Imm 8), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -84)));
        (Asm.SetCC (Asm.E, (Asm.Stack -84)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -84)));
        (Asm.JmpCC (Asm.E, "main.and.fl.31"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -88))); (Asm.Jmp "main.and.en.32");
        (Asm.Label "main.and.fl.31");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.Label "main.and.en.32");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.JmpCC (Asm.E, "main.and.fl.35"));
        (Asm.Cmp ((Asm.Imm 36), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.SetCC (Asm.E, (Asm.Stack -92)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.JmpCC (Asm.E, "main.and.fl.35"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -96))); (Asm.Jmp "main.and.en.36");
        (Asm.Label "main.and.fl.35");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -96)));
        (Asm.Label "main.and.en.36");
        (Asm.Mov ((Asm.Stack -96), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 37;
        offset = -96;
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
          e.4    -> -52,
          tmp.16 -> -56,
          tmp.19 -> -60,
          tmp.20 -> -64,
          tmp.21 -> -68,
          tmp.22 -> -72,
          tmp.25 -> -76,
          tmp.26 -> -80,
          tmp.29 -> -84,
          tmp.30 -> -88,
          tmp.33 -> -92,
          tmp.34 -> -96,
        }}}
     ])
