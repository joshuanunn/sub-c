(Asm.Program
   [Asm.Function {name = "lots_of_args"; global = true;
      instructions =
      [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack 16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack 24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack 32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Stack 40), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Stack 48), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Stack 56), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Stack 64), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Stack 72), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Stack 80), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 5;
        offset = -88;
        stack slots = {
          tmp.0  -> -4,
          a.0    -> -8,
          b.1    -> -12,
          c.2    -> -16,
          d.3    -> -20,
          e.4    -> -24,
          f.5    -> -28,
          g.6    -> -32,
          h.7    -> -36,
          i.8    -> -40,
          j.9    -> -44,
          k.10   -> -48,
          l.11   -> -52,
          m.12   -> -56,
          n.13   -> -60,
          o.14   -> -64,
          ret.15 -> -68,
          i.16   -> -72,
          tmp.1  -> -76,
          tmp.2  -> -80,
          tmp.3  -> -84,
          tmp.4  -> -88,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72))); (Asm.Label "loop.st.1");
         (Asm.Cmp ((Asm.Imm 10000000), (Asm.Stack -72)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.SetCC (Asm.L, (Asm.Stack -76)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.AllocateStack 8);
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.R9))); (Asm.Push (Asm.Imm 15));
         (Asm.Push (Asm.Imm 14)); (Asm.Push (Asm.Imm 13));
         (Asm.Mov ((Asm.Stack -68), (Asm.Reg Asm.AX)));
         (Asm.Push (Asm.Reg Asm.AX)); (Asm.Push (Asm.Imm 11));
         (Asm.Push (Asm.Imm 10)); (Asm.Push (Asm.Imm 9));
         (Asm.Push (Asm.Imm 8)); (Asm.Push (Asm.Imm 7));
         (Asm.Call "lots_of_args"); (Asm.DeallocateStack 80);
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -80)));
         (Asm.Mov ((Asm.Stack -80), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -68)));
         (Asm.Label "loop.ct.1");
         (Asm.Mov ((Asm.Stack -72), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -84)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -84)};
         (Asm.Mov ((Asm.Stack -84), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -72)));
         (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
         (Asm.Cmp ((Asm.Imm 150000000), (Asm.Stack -68)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.SetCC (Asm.E, (Asm.Stack -88)));
         (Asm.Mov ((Asm.Stack -88), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 5;
         offset = -88;
         stack slots = {
           tmp.0  -> -4,
           a.0    -> -8,
           b.1    -> -12,
           c.2    -> -16,
           d.3    -> -20,
           e.4    -> -24,
           f.5    -> -28,
           g.6    -> -32,
           h.7    -> -36,
           i.8    -> -40,
           j.9    -> -44,
           k.10   -> -48,
           l.11   -> -52,
           m.12   -> -56,
           n.13   -> -60,
           o.14   -> -64,
           ret.15 -> -68,
           i.16   -> -72,
           tmp.1  -> -76,
           tmp.2  -> -80,
           tmp.3  -> -84,
           tmp.4  -> -88,
         }}}
     ])
