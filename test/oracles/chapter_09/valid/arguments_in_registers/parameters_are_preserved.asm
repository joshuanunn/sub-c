(Asm.Program
   [Asm.Function {name = "g"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "g.and.fl.3"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "g.and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12))); (Asm.Jmp "g.and.en.4");
        (Asm.Label "g.and.fl.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Label "g.and.en.4"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "g.and.fl.7"));
        (Asm.Cmp ((Asm.Imm 6), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "g.and.fl.7"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20))); (Asm.Jmp "g.and.en.8");
        (Asm.Label "g.and.fl.7"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Label "g.and.en.8"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "g.and.fl.11"));
        (Asm.Cmp ((Asm.Imm 8), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "g.and.fl.11"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "g.and.en.12");
        (Asm.Label "g.and.fl.11"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Label "g.and.en.12"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "g.if.en.13"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "g.if.en.13"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "g";
        counter = 14;
        offset = -44;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.5  -> -16,
          tmp.6  -> -20,
          tmp.9  -> -24,
          tmp.10 -> -28,
          w.0    -> -32,
          x.1    -> -36,
          y.2    -> -40,
          z.3    -> -44,
        }}};
     Asm.Function {name = "f"; global = true;
       instructions =
       [(Asm.AllocateStack 80);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -64)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -68)));
         (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -72)));
         (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -76)));
         (Asm.Mov ((Asm.Stack -64), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -68), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -72), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -76), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R11)));
         Asm.Binary {op = Asm.Mult; src = (Asm.Imm 2);
           dst = (Asm.Reg Asm.R11)};
         (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.CX))); (Asm.Call "g");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.SetCC (Asm.E, (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.E, "f.and.fl.8"));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -64)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.E, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.E, "f.and.fl.8"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36))); (Asm.Jmp "f.and.en.9");
         (Asm.Label "f.and.fl.8"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.Label "f.and.en.9"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.E, "f.and.fl.12"));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -68)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.E, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.E, "f.and.fl.12"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44))); (Asm.Jmp "f.and.en.13");
         (Asm.Label "f.and.fl.12"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.Label "f.and.en.13"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.JmpCC (Asm.E, "f.and.fl.16"));
         (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -72)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.SetCC (Asm.E, (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.JmpCC (Asm.E, "f.and.fl.16"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -52))); (Asm.Jmp "f.and.en.17");
         (Asm.Label "f.and.fl.16"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.Label "f.and.en.17"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.JmpCC (Asm.E, "f.and.fl.20"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -76)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.SetCC (Asm.E, (Asm.Stack -56)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.JmpCC (Asm.E, "f.and.fl.20"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -60))); (Asm.Jmp "f.and.en.21");
         (Asm.Label "f.and.fl.20"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
         (Asm.Label "f.and.en.21");
         (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "f";
         counter = 22;
         offset = -76;
         stack slots = {
           result.8 -> -4,
           tmp.0    -> -8,
           tmp.1    -> -12,
           tmp.2    -> -16,
           tmp.3    -> -20,
           tmp.4    -> -24,
           tmp.5    -> -28,
           tmp.6    -> -32,
           tmp.7    -> -36,
           tmp.10   -> -40,
           tmp.11   -> -44,
           tmp.14   -> -48,
           tmp.15   -> -52,
           tmp.18   -> -56,
           tmp.19   -> -60,
           a.4      -> -64,
           b.5      -> -68,
           c.6      -> -72,
           d.7      -> -76,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.CX))); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}}
     ])
