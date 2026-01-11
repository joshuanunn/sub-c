(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 112);
        (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -108)));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
        (Asm.JmpCC (Asm.E, "target.if.en.0"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Label "target.if.en.0");
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
        (Asm.JmpCC (Asm.E, "target.if.en.2"));
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 9), (Asm.Stack -12)));
        (Asm.Label "target.if.en.2");
        (Asm.Mov ((Asm.Imm -12), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Imm -12), (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
        (Asm.JmpCC (Asm.E, "target.if.en.5"));
        (Asm.Mov ((Asm.Imm -11), (Asm.Stack -20)));
        (Asm.Label "target.if.en.5");
        (Asm.Mov ((Asm.Imm -100), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
        (Asm.JmpCC (Asm.E, "target.if.en.7"));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -28)};
        (Asm.Label "target.if.en.7");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
        (Asm.JmpCC (Asm.E, "target.if.el.9"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.SetCC (Asm.E, (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "target.and.fl.13"));
        (Asm.Cmp ((Asm.Imm 9), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "target.and.fl.13"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44)));
        (Asm.Jmp "target.and.en.14"); (Asm.Label "target.and.fl.13");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Label "target.and.en.14");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "target.and.fl.18"));
        (Asm.Mov ((Asm.Imm -11), (Asm.Stack -48)));
        (Asm.Cmp ((Asm.Imm -11), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.SetCC (Asm.E, (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "target.and.fl.18"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -56)));
        (Asm.Jmp "target.and.en.19"); (Asm.Label "target.and.fl.18");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.Label "target.and.en.19");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.JmpCC (Asm.E, "target.and.fl.23"));
        (Asm.Mov ((Asm.Imm -101), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.SetCC (Asm.E, (Asm.Stack -64)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
        (Asm.JmpCC (Asm.E, "target.and.fl.23"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -68)));
        (Asm.Jmp "target.and.en.24"); (Asm.Label "target.and.fl.23");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.Label "target.and.en.24");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
        (Asm.JmpCC (Asm.E, "target.if.en.25"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "target.if.en.25");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "target.if.el.9");
        (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.SetCC (Asm.E, (Asm.Stack -72)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
        (Asm.JmpCC (Asm.E, "target.and.fl.29"));
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.SetCC (Asm.E, (Asm.Stack -76)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
        (Asm.JmpCC (Asm.E, "target.and.fl.29"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -80)));
        (Asm.Jmp "target.and.en.30"); (Asm.Label "target.and.fl.29");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.Label "target.and.en.30");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
        (Asm.JmpCC (Asm.E, "target.and.fl.34"));
        (Asm.Mov ((Asm.Imm -12), (Asm.Stack -84)));
        (Asm.Mov ((Asm.Stack -84), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.SetCC (Asm.E, (Asm.Stack -88)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
        (Asm.JmpCC (Asm.E, "target.and.fl.34"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -92)));
        (Asm.Jmp "target.and.en.35"); (Asm.Label "target.and.fl.34");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.Label "target.and.en.35");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
        (Asm.JmpCC (Asm.E, "target.and.fl.39"));
        (Asm.Mov ((Asm.Imm -100), (Asm.Stack -96)));
        (Asm.Mov ((Asm.Stack -96), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -100)));
        (Asm.SetCC (Asm.E, (Asm.Stack -100)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -100)));
        (Asm.JmpCC (Asm.E, "target.and.fl.39"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -104)));
        (Asm.Jmp "target.and.en.40"); (Asm.Label "target.and.fl.39");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -104)));
        (Asm.Label "target.and.en.40");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -104)));
        (Asm.JmpCC (Asm.E, "target.if.en.41"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "target.if.en.41");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 42;
        offset = -108;
        stack slots = {
          w.1    -> -4,
          tmp.1  -> -8,
          x.2    -> -12,
          tmp.3  -> -16,
          y.3    -> -20,
          tmp.4  -> -24,
          z.4    -> -28,
          tmp.6  -> -32,
          tmp.10 -> -36,
          tmp.11 -> -40,
          tmp.12 -> -44,
          tmp.15 -> -48,
          tmp.16 -> -52,
          tmp.17 -> -56,
          tmp.20 -> -60,
          tmp.21 -> -64,
          tmp.22 -> -68,
          tmp.26 -> -72,
          tmp.27 -> -76,
          tmp.28 -> -80,
          tmp.31 -> -84,
          tmp.32 -> -88,
          tmp.33 -> -92,
          tmp.36 -> -96,
          tmp.37 -> -100,
          tmp.38 -> -104,
          flag.0 -> -108,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Call "target"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.JmpCC (Asm.E, "main.if.en.1"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.1");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI))); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.if.en.3"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.3");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 4;
         offset = -8;
         stack slots = {
           tmp.0 -> -4,
           tmp.2 -> -8,
         }}}
     ])
