(Asm.Program
   [Asm.Function {name = "inner_loop1"; global = true;
      instructions =
      [(Asm.AllocateStack 80); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -68)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.3"));
        (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.3"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Jmp "inner_loop1.or.en.4"); (Asm.Label "inner_loop1.or.tr.3");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "inner_loop1.or.en.4");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.7"));
        (Asm.Cmp ((Asm.Imm 12), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.7"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Jmp "inner_loop1.or.en.8"); (Asm.Label "inner_loop1.or.tr.7");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20)));
        (Asm.Label "inner_loop1.or.en.8");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.11"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.11"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Jmp "inner_loop1.or.en.12"); (Asm.Label "inner_loop1.or.tr.11");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28)));
        (Asm.Label "inner_loop1.or.en.12");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.15"));
        (Asm.Cmp ((Asm.Imm 20), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.15"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Jmp "inner_loop1.or.en.16"); (Asm.Label "inner_loop1.or.tr.15");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36)));
        (Asm.Label "inner_loop1.or.en.16");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.19"));
        (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.NE, "inner_loop1.or.tr.19"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Jmp "inner_loop1.or.en.20"); (Asm.Label "inner_loop1.or.tr.19");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44)));
        (Asm.Label "inner_loop1.or.en.20");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "inner_loop1.if.en.21"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "inner_loop1.if.en.21");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "inner_loop1";
        counter = 22;
        offset = -68;
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
          a.0    -> -48,
          b.1    -> -52,
          c.2    -> -56,
          d.3    -> -60,
          e.4    -> -64,
          f.5    -> -68,
        }}};
     Asm.Function {name = "inner_loop2"; global = true;
       instructions =
       [(Asm.AllocateStack 128);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -96)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -100)));
         (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -104)));
         (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -108)));
         (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -112)));
         (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -116)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Data "outer_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.SetCC (Asm.E, (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.JmpCC (Asm.E, "inner_loop2.if.el.2"));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -96)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.6"));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -100)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.6"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.Jmp "inner_loop2.or.en.7"); (Asm.Label "inner_loop2.or.tr.6");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
         (Asm.Label "inner_loop2.or.en.7");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.10"));
         (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -104)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.10"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.Jmp "inner_loop2.or.en.11");
         (Asm.Label "inner_loop2.or.tr.10");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
         (Asm.Label "inner_loop2.or.en.11");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.14"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -108)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.14"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.Jmp "inner_loop2.or.en.15");
         (Asm.Label "inner_loop2.or.tr.14");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32)));
         (Asm.Label "inner_loop2.or.en.15");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.18"));
         (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -112)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.18"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.Jmp "inner_loop2.or.en.19");
         (Asm.Label "inner_loop2.or.tr.18");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -40)));
         (Asm.Label "inner_loop2.or.en.19");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.22"));
         (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -116)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -44)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.22"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.Jmp "inner_loop2.or.en.23");
         (Asm.Label "inner_loop2.or.tr.22");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -48)));
         (Asm.Label "inner_loop2.or.en.23");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.JmpCC (Asm.E, "inner_loop2.if.en.24"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "inner_loop2.if.en.24"); (Asm.Jmp "inner_loop2.if.en.1");
         (Asm.Label "inner_loop2.if.el.2");
         (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -96)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -52)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.28"));
         (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -100)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.28"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
         (Asm.Jmp "inner_loop2.or.en.29");
         (Asm.Label "inner_loop2.or.tr.28");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -60)));
         (Asm.Label "inner_loop2.or.en.29");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -60)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.32"));
         (Asm.Cmp ((Asm.Imm 12), (Asm.Stack -104)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -64)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.32"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.Jmp "inner_loop2.or.en.33");
         (Asm.Label "inner_loop2.or.tr.32");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -68)));
         (Asm.Label "inner_loop2.or.en.33");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.36"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -108)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -72)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.36"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.Jmp "inner_loop2.or.en.37");
         (Asm.Label "inner_loop2.or.tr.36");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -76)));
         (Asm.Label "inner_loop2.or.en.37");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.40"));
         (Asm.Cmp ((Asm.Imm 20), (Asm.Stack -112)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -80)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.40"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.Jmp "inner_loop2.or.en.41");
         (Asm.Label "inner_loop2.or.tr.40");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -84)));
         (Asm.Label "inner_loop2.or.en.41");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.44"));
         (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -116)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -88)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.JmpCC (Asm.NE, "inner_loop2.or.tr.44"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.Jmp "inner_loop2.or.en.45");
         (Asm.Label "inner_loop2.or.tr.44");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -92)));
         (Asm.Label "inner_loop2.or.en.45");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.JmpCC (Asm.E, "inner_loop2.if.en.46"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "inner_loop2.if.en.46");
         (Asm.Label "inner_loop2.if.en.1");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "inner_loop2";
         counter = 47;
         offset = -116;
         stack slots = {
           tmp.0  -> -4,
           tmp.3  -> -8,
           tmp.4  -> -12,
           tmp.5  -> -16,
           tmp.8  -> -20,
           tmp.9  -> -24,
           tmp.12 -> -28,
           tmp.13 -> -32,
           tmp.16 -> -36,
           tmp.17 -> -40,
           tmp.20 -> -44,
           tmp.21 -> -48,
           tmp.25 -> -52,
           tmp.26 -> -56,
           tmp.27 -> -60,
           tmp.30 -> -64,
           tmp.31 -> -68,
           tmp.34 -> -72,
           tmp.35 -> -76,
           tmp.38 -> -80,
           tmp.39 -> -84,
           tmp.42 -> -88,
           tmp.43 -> -92,
           a.6    -> -96,
           b.7    -> -100,
           c.8    -> -104,
           d.9    -> -108,
           e.10   -> -112,
           f.11   -> -116,
         }}};
     Asm.Function {name = "inner_loop3"; global = true;
       instructions =
       [(Asm.AllocateStack 176);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -144)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -148)));
         (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -152)));
         (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -156)));
         (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -160)));
         (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -164)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Data "outer_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.SetCC (Asm.E, (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.JmpCC (Asm.E, "inner_loop3.if.el.2"));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Data "inner_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "inner_loop3.if.el.5"));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -144)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.9"));
         (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -148)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.9"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.Jmp "inner_loop3.or.en.10"); (Asm.Label "inner_loop3.or.tr.9");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20)));
         (Asm.Label "inner_loop3.or.en.10");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.13"));
         (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -152)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.13"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.Jmp "inner_loop3.or.en.14");
         (Asm.Label "inner_loop3.or.tr.13");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28)));
         (Asm.Label "inner_loop3.or.en.14");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.17"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -156)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.17"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.Jmp "inner_loop3.or.en.18");
         (Asm.Label "inner_loop3.or.tr.17");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36)));
         (Asm.Label "inner_loop3.or.en.18");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.21"));
         (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -160)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.21"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.Jmp "inner_loop3.or.en.22");
         (Asm.Label "inner_loop3.or.tr.21");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44)));
         (Asm.Label "inner_loop3.or.en.22");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.25"));
         (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -164)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.25"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.Jmp "inner_loop3.or.en.26");
         (Asm.Label "inner_loop3.or.tr.25");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -52)));
         (Asm.Label "inner_loop3.or.en.26");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.JmpCC (Asm.E, "inner_loop3.if.en.27"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "inner_loop3.if.en.27"); (Asm.Jmp "inner_loop3.if.en.4");
         (Asm.Label "inner_loop3.if.el.5");
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -144)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.31"));
         (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -148)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -60)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -60)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.31"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.Jmp "inner_loop3.or.en.32");
         (Asm.Label "inner_loop3.or.tr.31");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -64)));
         (Asm.Label "inner_loop3.or.en.32");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.35"));
         (Asm.Cmp ((Asm.Imm 12), (Asm.Stack -152)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -68)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.35"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.Jmp "inner_loop3.or.en.36");
         (Asm.Label "inner_loop3.or.tr.35");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -72)));
         (Asm.Label "inner_loop3.or.en.36");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.39"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -156)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -76)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.39"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.Jmp "inner_loop3.or.en.40");
         (Asm.Label "inner_loop3.or.tr.39");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -80)));
         (Asm.Label "inner_loop3.or.en.40");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.43"));
         (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -160)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -84)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.43"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.Jmp "inner_loop3.or.en.44");
         (Asm.Label "inner_loop3.or.tr.43");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -88)));
         (Asm.Label "inner_loop3.or.en.44");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.47"));
         (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -164)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -92)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.47"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -96)));
         (Asm.Jmp "inner_loop3.or.en.48");
         (Asm.Label "inner_loop3.or.tr.47");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -96)));
         (Asm.Label "inner_loop3.or.en.48");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -96)));
         (Asm.JmpCC (Asm.E, "inner_loop3.if.en.49"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "inner_loop3.if.en.49");
         (Asm.Label "inner_loop3.if.en.4"); (Asm.Jmp "inner_loop3.if.en.1");
         (Asm.Label "inner_loop3.if.el.2");
         (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -144)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -100)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -100)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -100)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.53"));
         (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -148)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -104)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -104)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -104)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.53"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -108)));
         (Asm.Jmp "inner_loop3.or.en.54");
         (Asm.Label "inner_loop3.or.tr.53");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -108)));
         (Asm.Label "inner_loop3.or.en.54");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.57"));
         (Asm.Cmp ((Asm.Imm 12), (Asm.Stack -152)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -112)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -112)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -112)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.57"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -116)));
         (Asm.Jmp "inner_loop3.or.en.58");
         (Asm.Label "inner_loop3.or.tr.57");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -116)));
         (Asm.Label "inner_loop3.or.en.58");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -116)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.61"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -156)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -120)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -120)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -120)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.61"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -124)));
         (Asm.Jmp "inner_loop3.or.en.62");
         (Asm.Label "inner_loop3.or.tr.61");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -124)));
         (Asm.Label "inner_loop3.or.en.62");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -124)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.65"));
         (Asm.Cmp ((Asm.Imm 20), (Asm.Stack -160)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -128)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -128)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -128)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.65"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -132)));
         (Asm.Jmp "inner_loop3.or.en.66");
         (Asm.Label "inner_loop3.or.tr.65");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -132)));
         (Asm.Label "inner_loop3.or.en.66");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -132)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.69"));
         (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -164)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -136)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -136)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -136)));
         (Asm.JmpCC (Asm.NE, "inner_loop3.or.tr.69"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -140)));
         (Asm.Jmp "inner_loop3.or.en.70");
         (Asm.Label "inner_loop3.or.tr.69");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -140)));
         (Asm.Label "inner_loop3.or.en.70");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -140)));
         (Asm.JmpCC (Asm.E, "inner_loop3.if.en.71"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "inner_loop3.if.en.71");
         (Asm.Label "inner_loop3.if.en.1");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "inner_loop3";
         counter = 72;
         offset = -164;
         stack slots = {
           tmp.0  -> -4,
           tmp.3  -> -8,
           tmp.6  -> -12,
           tmp.7  -> -16,
           tmp.8  -> -20,
           tmp.11 -> -24,
           tmp.12 -> -28,
           tmp.15 -> -32,
           tmp.16 -> -36,
           tmp.19 -> -40,
           tmp.20 -> -44,
           tmp.23 -> -48,
           tmp.24 -> -52,
           tmp.28 -> -56,
           tmp.29 -> -60,
           tmp.30 -> -64,
           tmp.33 -> -68,
           tmp.34 -> -72,
           tmp.37 -> -76,
           tmp.38 -> -80,
           tmp.41 -> -84,
           tmp.42 -> -88,
           tmp.45 -> -92,
           tmp.46 -> -96,
           tmp.50 -> -100,
           tmp.51 -> -104,
           tmp.52 -> -108,
           tmp.55 -> -112,
           tmp.56 -> -116,
           tmp.59 -> -120,
           tmp.60 -> -124,
           tmp.63 -> -128,
           tmp.64 -> -132,
           tmp.67 -> -136,
           tmp.68 -> -140,
           a.12   -> -144,
           b.13   -> -148,
           c.14   -> -152,
           d.15   -> -156,
           e.16   -> -160,
           f.17   -> -164,
         }}};
     Asm.Function {name = "inner_loop4"; global = true;
       instructions =
       [(Asm.AllocateStack 48);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -28)));
         (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -32)));
         (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -36)));
         (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -40)));
         (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -44)));
         (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -12)};
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -16)};
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -20)};
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "inner_loop4";
         counter = 5;
         offset = -44;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.2 -> -12,
           tmp.3 -> -16,
           tmp.4 -> -20,
           a.18  -> -24,
           b.19  -> -28,
           c.20  -> -32,
           d.21  -> -36,
           e.22  -> -40,
           f.23  -> -44,
         }}};
     Asm.Function {name = "validate"; global = true;
       instructions =
       [(Asm.AllocateStack 80);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -48)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -52)));
         (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -56)));
         (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -60)));
         (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -64)));
         (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -68)));
         (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -48)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.3"));
         (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -52)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.3"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.Jmp "validate.or.en.4"); (Asm.Label "validate.or.tr.3");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
         (Asm.Label "validate.or.en.4");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.7"));
         (Asm.Cmp ((Asm.Imm 12), (Asm.Stack -56)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.7"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.Jmp "validate.or.en.8"); (Asm.Label "validate.or.tr.7");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20)));
         (Asm.Label "validate.or.en.8");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.11"));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -60)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.11"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.Jmp "validate.or.en.12"); (Asm.Label "validate.or.tr.11");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28)));
         (Asm.Label "validate.or.en.12");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.15"));
         (Asm.Cmp ((Asm.Imm 20), (Asm.Stack -64)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.15"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.Jmp "validate.or.en.16"); (Asm.Label "validate.or.tr.15");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36)));
         (Asm.Label "validate.or.en.16");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.19"));
         (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -68)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.NE, "validate.or.tr.19"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.Jmp "validate.or.en.20"); (Asm.Label "validate.or.tr.19");
         (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44)));
         (Asm.Label "validate.or.en.20");
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.JmpCC (Asm.E, "validate.if.en.21"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "validate.if.en.21");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "validate";
         counter = 22;
         offset = -68;
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
           a.24   -> -48,
           b.25   -> -52,
           c.26   -> -56,
           d.27   -> -60,
           e.28   -> -64,
           f.29   -> -68,
         }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 96); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Imm 5), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Stack -24))); (Asm.Label "loop.ct.1");
         (Asm.Cmp ((Asm.Imm 2), (Asm.Data "outer_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.SetCC (Asm.L, (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Label "loop.ct.2");
         (Asm.Cmp ((Asm.Imm 1), (Asm.Data "inner_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.L, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.E, "loop.br.2"));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Reg Asm.R9)));
         (Asm.Call "inner_loop1");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.E, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.E, "target.if.en.4"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "target.if.en.4");
         (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Data "inner_flag")));
         (Asm.Jmp "loop.ct.2"); (Asm.Label "loop.br.2");
         (Asm.Label "loop.ct.3");
         (Asm.Cmp ((Asm.Imm 2), (Asm.Data "inner_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.SetCC (Asm.L, (Asm.Stack -44)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.JmpCC (Asm.E, "loop.br.3"));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Reg Asm.R9)));
         (Asm.Call "inner_loop2");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.SetCC (Asm.E, (Asm.Stack -52)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.JmpCC (Asm.E, "target.if.en.8"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "target.if.en.8");
         (Asm.Mov ((Asm.Imm 11), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Data "inner_flag")));
         (Asm.Jmp "loop.ct.3"); (Asm.Label "loop.br.3");
         (Asm.Label "loop.ct.4");
         (Asm.Cmp ((Asm.Imm 4), (Asm.Data "inner_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.SetCC (Asm.L, (Asm.Stack -56)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.JmpCC (Asm.E, "loop.br.4"));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Reg Asm.R9)));
         (Asm.Call "inner_loop3");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -60)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -60)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.SetCC (Asm.E, (Asm.Stack -64)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.JmpCC (Asm.E, "target.if.en.12"));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "target.if.en.12");
         (Asm.Mov ((Asm.Data "inner_flag"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -68)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -68)};
         (Asm.Mov ((Asm.Stack -68), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "inner_flag")));
         (Asm.Mov ((Asm.Imm 12), (Asm.Stack -12))); (Asm.Jmp "loop.ct.4");
         (Asm.Label "loop.br.4"); (Asm.Label "loop.ct.5");
         (Asm.Cmp ((Asm.Imm 4), (Asm.Data "inner_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.SetCC (Asm.L, (Asm.Stack -72)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.JmpCC (Asm.E, "loop.br.5"));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Reg Asm.R9)));
         (Asm.Call "inner_loop4");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -76)));
         (Asm.Mov ((Asm.Imm 13), (Asm.Stack -16))); (Asm.Jmp "loop.ct.5");
         (Asm.Label "loop.br.5"); (Asm.Mov ((Asm.Imm 20), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Data "outer_flag"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -80)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -80)};
         (Asm.Mov ((Asm.Stack -80), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "outer_flag")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Data "inner_flag")));
         (Asm.Jmp "loop.ct.1"); (Asm.Label "loop.br.1");
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Reg Asm.R9))); (Asm.Call "validate");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -84)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.SetCC (Asm.E, (Asm.Stack -88)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.JmpCC (Asm.E, "target.if.en.19"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "target.if.en.19");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 20;
         offset = -88;
         stack slots = {
           a.30   -> -4,
           b.31   -> -8,
           c.32   -> -12,
           d.33   -> -16,
           e.34   -> -20,
           f.35   -> -24,
           tmp.0  -> -28,
           tmp.1  -> -32,
           tmp.2  -> -36,
           tmp.3  -> -40,
           tmp.5  -> -44,
           tmp.6  -> -48,
           tmp.7  -> -52,
           tmp.9  -> -56,
           tmp.10 -> -60,
           tmp.11 -> -64,
           tmp.13 -> -68,
           tmp.14 -> -72,
           tmp.15 -> -76,
           tmp.16 -> -80,
           tmp.17 -> -84,
           tmp.18 -> -88,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "outer_flag"; global = false; init = 0};
     Asm.StaticVariable {name = "inner_flag"; global = false; init = 1}])
