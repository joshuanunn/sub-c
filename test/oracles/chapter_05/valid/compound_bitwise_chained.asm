(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 144); (Asm.Mov ((Asm.Imm 250), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 200), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 100), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 75), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 50), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 25), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.CX)));
        (Asm.Shl ((Asm.Reg Asm.CX), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.CX)));
        (Asm.Sar ((Asm.Reg Asm.CX), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -52)};
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwXor; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -56)};
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 100), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwOr; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -60)};
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 200), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Stack -60);
          dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 250), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.BwAnd; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -68)};
        (Asm.Mov ((Asm.Stack -68), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -68), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 40), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.SetCC (Asm.E, (Asm.Stack -72)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.JmpCC (Asm.E, "main.and.fl.10"));
        (Asm.Cmp ((Asm.Imm 21800), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.SetCC (Asm.E, (Asm.Stack -76)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.JmpCC (Asm.E, "main.and.fl.10"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -80))); (Asm.Jmp "main.and.en.11");
        (Asm.Label "main.and.fl.10");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.Label "main.and.en.11");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.JmpCC (Asm.E, "main.and.fl.14"));
        (Asm.Cmp ((Asm.Imm 109), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -84)));
        (Asm.SetCC (Asm.E, (Asm.Stack -84)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -84)));
        (Asm.JmpCC (Asm.E, "main.and.fl.14"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -88))); (Asm.Jmp "main.and.en.15");
        (Asm.Label "main.and.fl.14");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.Label "main.and.en.15");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.JmpCC (Asm.E, "main.and.fl.18"));
        (Asm.Cmp ((Asm.Imm 41), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.SetCC (Asm.E, (Asm.Stack -92)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.JmpCC (Asm.E, "main.and.fl.18"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -96))); (Asm.Jmp "main.and.en.19");
        (Asm.Label "main.and.fl.18");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -96)));
        (Asm.Label "main.and.en.19");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -96)));
        (Asm.JmpCC (Asm.E, "main.and.fl.22"));
        (Asm.Cmp ((Asm.Imm 41), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -100)));
        (Asm.SetCC (Asm.E, (Asm.Stack -100)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -100)));
        (Asm.JmpCC (Asm.E, "main.and.fl.22"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -104)));
        (Asm.Jmp "main.and.en.23"); (Asm.Label "main.and.fl.22");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -104)));
        (Asm.Label "main.and.en.23");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -104)));
        (Asm.JmpCC (Asm.E, "main.and.fl.26"));
        (Asm.Cmp ((Asm.Imm 27), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -108)));
        (Asm.SetCC (Asm.E, (Asm.Stack -108)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
        (Asm.JmpCC (Asm.E, "main.and.fl.26"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -112)));
        (Asm.Jmp "main.and.en.27"); (Asm.Label "main.and.fl.26");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -112)));
        (Asm.Label "main.and.en.27");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -112)));
        (Asm.JmpCC (Asm.E, "main.and.fl.30"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -116)));
        (Asm.SetCC (Asm.E, (Asm.Stack -116)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -116)));
        (Asm.JmpCC (Asm.E, "main.and.fl.30"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -120)));
        (Asm.Jmp "main.and.en.31"); (Asm.Label "main.and.fl.30");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -120)));
        (Asm.Label "main.and.en.31");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -120)));
        (Asm.JmpCC (Asm.E, "main.and.fl.34"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -124)));
        (Asm.SetCC (Asm.E, (Asm.Stack -124)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -124)));
        (Asm.JmpCC (Asm.E, "main.and.fl.34"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -128)));
        (Asm.Jmp "main.and.en.35"); (Asm.Label "main.and.fl.34");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -128)));
        (Asm.Label "main.and.en.35");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -128)));
        (Asm.JmpCC (Asm.E, "main.and.fl.38"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -132)));
        (Asm.SetCC (Asm.E, (Asm.Stack -132)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -132)));
        (Asm.JmpCC (Asm.E, "main.and.fl.38"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -136)));
        (Asm.Jmp "main.and.en.39"); (Asm.Label "main.and.fl.38");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -136)));
        (Asm.Label "main.and.en.39");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -136)));
        (Asm.JmpCC (Asm.E, "main.and.fl.42"));
        (Asm.Cmp ((Asm.Imm 40), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -140)));
        (Asm.SetCC (Asm.E, (Asm.Stack -140)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -140)));
        (Asm.JmpCC (Asm.E, "main.and.fl.42"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -144)));
        (Asm.Jmp "main.and.en.43"); (Asm.Label "main.and.fl.42");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -144)));
        (Asm.Label "main.and.en.43");
        (Asm.Mov ((Asm.Stack -144), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 44;
        offset = -144;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          d.3    -> -16,
          e.4    -> -20,
          f.5    -> -24,
          g.6    -> -28,
          h.7    -> -32,
          j.8    -> -36,
          x.9    -> -40,
          tmp.0  -> -44,
          tmp.1  -> -48,
          tmp.2  -> -52,
          tmp.3  -> -56,
          tmp.4  -> -60,
          tmp.5  -> -64,
          tmp.6  -> -68,
          tmp.7  -> -72,
          tmp.8  -> -76,
          tmp.9  -> -80,
          tmp.12 -> -84,
          tmp.13 -> -88,
          tmp.16 -> -92,
          tmp.17 -> -96,
          tmp.20 -> -100,
          tmp.21 -> -104,
          tmp.24 -> -108,
          tmp.25 -> -112,
          tmp.28 -> -116,
          tmp.29 -> -120,
          tmp.32 -> -124,
          tmp.33 -> -128,
          tmp.36 -> -132,
          tmp.37 -> -136,
          tmp.40 -> -140,
          tmp.41 -> -144,
        }}}
     ])
