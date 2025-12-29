(Asm.Program
   [Asm.Function {name = "g"; global = true;
      instructions =
      [(Asm.AllocateStack 128);
        (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "and.fl.3"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12))); (Asm.Jmp "and.en.4");
        (Asm.Label "and.fl.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Label "and.en.4"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "and.fl.7"));
        (Asm.Cmp ((Asm.Imm 6), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "and.fl.7"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20))); (Asm.Jmp "and.en.8");
        (Asm.Label "and.fl.7"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Label "and.en.8"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Cmp ((Asm.Imm 8), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "and.en.12");
        (Asm.Label "and.fl.11"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Label "and.en.12"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "if.en.13"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.13"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 37;
        offset = -124;
        stack slots = {
          tmp.0    -> -4,
          tmp.1    -> -8,
          tmp.2    -> -12,
          tmp.5    -> -16,
          tmp.6    -> -20,
          tmp.9    -> -24,
          tmp.10   -> -28,
          w.0      -> -32,
          x.1      -> -36,
          y.2      -> -40,
          z.3      -> -44,
          result.8 -> -48,
          tmp.14   -> -52,
          tmp.15   -> -56,
          tmp.16   -> -60,
          tmp.17   -> -64,
          tmp.18   -> -68,
          tmp.19   -> -72,
          tmp.20   -> -76,
          tmp.21   -> -80,
          tmp.24   -> -84,
          tmp.25   -> -88,
          tmp.28   -> -92,
          tmp.29   -> -96,
          tmp.32   -> -100,
          tmp.33   -> -104,
          a.4      -> -108,
          b.5      -> -112,
          c.6      -> -116,
          d.7      -> -120,
          tmp.36   -> -124,
        }}};
     Asm.Function {name = "f"; global = true;
       instructions =
       [(Asm.AllocateStack 128);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -108)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -112)));
         (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -116)));
         (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -120)));
         (Asm.Mov ((Asm.Stack -108), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
         (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -52)));
         (Asm.Mov ((Asm.Stack -112), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -56)));
         (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -56)));
         (Asm.Mov ((Asm.Stack -116), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -60)));
         (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -60)));
         (Asm.Mov ((Asm.Stack -120), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -64)));
         (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -64)));
         (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.CX))); (Asm.Call "g");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -68)));
         (Asm.Mov ((Asm.Stack -68), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -48)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.SetCC (Asm.E, (Asm.Stack -72)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.JmpCC (Asm.E, "and.fl.22"));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -108)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.SetCC (Asm.E, (Asm.Stack -76)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.JmpCC (Asm.E, "and.fl.22"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -80))); (Asm.Jmp "and.en.23");
         (Asm.Label "and.fl.22"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.Label "and.en.23"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.JmpCC (Asm.E, "and.fl.26"));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -112)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.SetCC (Asm.E, (Asm.Stack -84)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.JmpCC (Asm.E, "and.fl.26"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -88))); (Asm.Jmp "and.en.27");
         (Asm.Label "and.fl.26"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.Label "and.en.27"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.JmpCC (Asm.E, "and.fl.30"));
         (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -116)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.SetCC (Asm.E, (Asm.Stack -92)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.JmpCC (Asm.E, "and.fl.30"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -96))); (Asm.Jmp "and.en.31");
         (Asm.Label "and.fl.30"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -96)));
         (Asm.Label "and.en.31"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -96)));
         (Asm.JmpCC (Asm.E, "and.fl.34"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -120)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -100)));
         (Asm.SetCC (Asm.E, (Asm.Stack -100)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -100)));
         (Asm.JmpCC (Asm.E, "and.fl.34"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -104))); (Asm.Jmp "and.en.35");
         (Asm.Label "and.fl.34"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -104)));
         (Asm.Label "and.en.35");
         (Asm.Mov ((Asm.Stack -104), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 37;
         offset = -124;
         stack slots = {
           tmp.0    -> -4,
           tmp.1    -> -8,
           tmp.2    -> -12,
           tmp.5    -> -16,
           tmp.6    -> -20,
           tmp.9    -> -24,
           tmp.10   -> -28,
           w.0      -> -32,
           x.1      -> -36,
           y.2      -> -40,
           z.3      -> -44,
           result.8 -> -48,
           tmp.14   -> -52,
           tmp.15   -> -56,
           tmp.16   -> -60,
           tmp.17   -> -64,
           tmp.18   -> -68,
           tmp.19   -> -72,
           tmp.20   -> -76,
           tmp.21   -> -80,
           tmp.24   -> -84,
           tmp.25   -> -88,
           tmp.28   -> -92,
           tmp.29   -> -96,
           tmp.32   -> -100,
           tmp.33   -> -104,
           a.4      -> -108,
           b.5      -> -112,
           c.6      -> -116,
           d.7      -> -120,
           tmp.36   -> -124,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 128); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.CX))); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -124)));
         (Asm.Mov ((Asm.Stack -124), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 37;
         offset = -124;
         stack slots = {
           tmp.0    -> -4,
           tmp.1    -> -8,
           tmp.2    -> -12,
           tmp.5    -> -16,
           tmp.6    -> -20,
           tmp.9    -> -24,
           tmp.10   -> -28,
           w.0      -> -32,
           x.1      -> -36,
           y.2      -> -40,
           z.3      -> -44,
           result.8 -> -48,
           tmp.14   -> -52,
           tmp.15   -> -56,
           tmp.16   -> -60,
           tmp.17   -> -64,
           tmp.18   -> -68,
           tmp.19   -> -72,
           tmp.20   -> -76,
           tmp.21   -> -80,
           tmp.24   -> -84,
           tmp.25   -> -88,
           tmp.28   -> -92,
           tmp.29   -> -96,
           tmp.32   -> -100,
           tmp.33   -> -104,
           a.4      -> -108,
           b.5      -> -112,
           c.6      -> -116,
           d.7      -> -120,
           tmp.36   -> -124,
         }}}
     ])
