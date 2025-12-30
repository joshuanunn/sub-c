(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 128); (Asm.Mov ((Asm.Imm 250), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 200), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 100), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 75), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm -25), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm -7), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Idiv (Asm.Stack -28));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Idiv (Asm.Stack -20));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -52)};
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -56)};
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 2250), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
        (Asm.SetCC (Asm.E, (Asm.Stack -60)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -60)));
        (Asm.JmpCC (Asm.E, "main.and.fl.10"));
        (Asm.Cmp ((Asm.Imm 2000), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.SetCC (Asm.E, (Asm.Stack -64)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.JmpCC (Asm.E, "main.and.fl.10"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -68))); (Asm.Jmp "main.and.en.11");
        (Asm.Label "main.and.fl.10");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.Label "main.and.en.11");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.JmpCC (Asm.E, "main.and.fl.15"));
        (Asm.Mov ((Asm.Imm -1800), (Asm.Stack -72)));
        (Asm.Mov ((Asm.Stack -72), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.SetCC (Asm.E, (Asm.Stack -76)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.JmpCC (Asm.E, "main.and.fl.15"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -80))); (Asm.Jmp "main.and.en.16");
        (Asm.Label "main.and.fl.15");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.Label "main.and.en.16");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.JmpCC (Asm.E, "main.and.fl.20"));
        (Asm.Mov ((Asm.Imm -18), (Asm.Stack -84)));
        (Asm.Mov ((Asm.Stack -84), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.SetCC (Asm.E, (Asm.Stack -88)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.JmpCC (Asm.E, "main.and.fl.20"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -92))); (Asm.Jmp "main.and.en.21");
        (Asm.Label "main.and.fl.20");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.Label "main.and.en.21");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.JmpCC (Asm.E, "main.and.fl.25"));
        (Asm.Mov ((Asm.Imm -4), (Asm.Stack -96)));
        (Asm.Mov ((Asm.Stack -96), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -100)));
        (Asm.SetCC (Asm.E, (Asm.Stack -100)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -100)));
        (Asm.JmpCC (Asm.E, "main.and.fl.25"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -104)));
        (Asm.Jmp "main.and.en.26"); (Asm.Label "main.and.fl.25");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -104)));
        (Asm.Label "main.and.en.26");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -104)));
        (Asm.JmpCC (Asm.E, "main.and.fl.30"));
        (Asm.Mov ((Asm.Imm -7), (Asm.Stack -108)));
        (Asm.Mov ((Asm.Stack -108), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -112)));
        (Asm.SetCC (Asm.E, (Asm.Stack -112)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -112)));
        (Asm.JmpCC (Asm.E, "main.and.fl.30"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -116)));
        (Asm.Jmp "main.and.en.31"); (Asm.Label "main.and.fl.30");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -116)));
        (Asm.Label "main.and.en.31");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -116)));
        (Asm.JmpCC (Asm.E, "main.and.fl.34"));
        (Asm.Cmp ((Asm.Imm 2250), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -120)));
        (Asm.SetCC (Asm.E, (Asm.Stack -120)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -120)));
        (Asm.JmpCC (Asm.E, "main.and.fl.34"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -124)));
        (Asm.Jmp "main.and.en.35"); (Asm.Label "main.and.fl.34");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -124)));
        (Asm.Label "main.and.en.35");
        (Asm.Mov ((Asm.Stack -124), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 36;
        offset = -124;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          d.3    -> -16,
          e.4    -> -20,
          tmp.0  -> -24,
          f.5    -> -28,
          x.6    -> -32,
          tmp.1  -> -36,
          tmp.2  -> -40,
          tmp.3  -> -44,
          tmp.4  -> -48,
          tmp.5  -> -52,
          tmp.6  -> -56,
          tmp.7  -> -60,
          tmp.8  -> -64,
          tmp.9  -> -68,
          tmp.12 -> -72,
          tmp.13 -> -76,
          tmp.14 -> -80,
          tmp.17 -> -84,
          tmp.18 -> -88,
          tmp.19 -> -92,
          tmp.22 -> -96,
          tmp.23 -> -100,
          tmp.24 -> -104,
          tmp.27 -> -108,
          tmp.28 -> -112,
          tmp.29 -> -116,
          tmp.32 -> -120,
          tmp.33 -> -124,
        }}}
     ])
