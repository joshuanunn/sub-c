(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions =
      [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -72)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -76)));
        (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -80)));
        (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -84)));
        (Asm.Mov ((Asm.Stack 16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -88)));
        (Asm.Mov ((Asm.Stack 24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -92)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "and.fl.3"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12))); (Asm.Jmp "and.en.4");
        (Asm.Label "and.fl.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Label "and.en.4"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "and.fl.7"));
        (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -72)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "and.fl.7"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20))); (Asm.Jmp "and.en.8");
        (Asm.Label "and.fl.7"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Label "and.en.8"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -76)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "and.en.12");
        (Asm.Label "and.fl.11"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Label "and.en.12"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "and.fl.15"));
        (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -80)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "and.fl.15"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36))); (Asm.Jmp "and.en.16");
        (Asm.Label "and.fl.15"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Label "and.en.16"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "and.fl.19"));
        (Asm.Cmp ((Asm.Imm 6), (Asm.Stack -84)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "and.fl.19"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44))); (Asm.Jmp "and.en.20");
        (Asm.Label "and.fl.19"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Label "and.en.20"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "and.fl.23"));
        (Asm.Cmp ((Asm.Imm 7), (Asm.Stack -88)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.SetCC (Asm.E, (Asm.Stack -48)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.JmpCC (Asm.E, "and.fl.23"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -52))); (Asm.Jmp "and.en.24");
        (Asm.Label "and.fl.23"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.Label "and.en.24"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "and.fl.27"));
        (Asm.Cmp ((Asm.Imm 8), (Asm.Stack -92)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.SetCC (Asm.E, (Asm.Stack -56)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.JmpCC (Asm.E, "and.fl.27"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -60))); (Asm.Jmp "and.en.28");
        (Asm.Label "and.fl.27"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
        (Asm.Label "and.en.28");
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 30;
        offset = -96;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.5  -> -16,
          tmp.6  -> -20,
          tmp.9  -> -24,
          tmp.10 -> -28,
          tmp.13 -> -32,
          tmp.14 -> -36,
          tmp.17 -> -40,
          tmp.18 -> -44,
          tmp.21 -> -48,
          tmp.22 -> -52,
          tmp.25 -> -56,
          tmp.26 -> -60,
          a.0    -> -64,
          b.1    -> -68,
          c.2    -> -72,
          d.3    -> -76,
          e.4    -> -80,
          f.5    -> -84,
          g.6    -> -88,
          h.7    -> -92,
          tmp.29 -> -96,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.R9))); (Asm.Push (Asm.Imm 8));
         (Asm.Push (Asm.Imm 7)); (Asm.Call "foo"); (Asm.DeallocateStack 16);
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -96)));
         (Asm.Mov ((Asm.Stack -96), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 30;
         offset = -96;
         stack slots = {
           tmp.0  -> -4,
           tmp.1  -> -8,
           tmp.2  -> -12,
           tmp.5  -> -16,
           tmp.6  -> -20,
           tmp.9  -> -24,
           tmp.10 -> -28,
           tmp.13 -> -32,
           tmp.14 -> -36,
           tmp.17 -> -40,
           tmp.18 -> -44,
           tmp.21 -> -48,
           tmp.22 -> -52,
           tmp.25 -> -56,
           tmp.26 -> -60,
           a.0    -> -64,
           b.1    -> -68,
           c.2    -> -72,
           d.3    -> -76,
           e.4    -> -80,
           f.5    -> -84,
           g.6    -> -88,
           h.7    -> -92,
           tmp.29 -> -96,
         }}}
     ])
