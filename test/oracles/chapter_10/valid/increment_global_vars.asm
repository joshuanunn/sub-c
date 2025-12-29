(Asm.Program
   [Asm.Function {name = "incr_i"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Cmp ((Asm.Imm 1), (Asm.Data "i")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "if.en.1"));
        (Asm.Mov ((Asm.Data "i"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Data "i")};
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Data "i")};
        (Asm.Label "if.en.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 21;
        offset = -52;
        stack slots = {
          tmp.0  -> -4,
          tmp.2  -> -8,
          tmp.3  -> -12,
          tmp.4  -> -16,
          tmp.6  -> -20,
          tmp.7  -> -24,
          tmp.8  -> -28,
          tmp.11 -> -32,
          tmp.12 -> -36,
          tmp.14 -> -40,
          tmp.17 -> -44,
          tmp.18 -> -48,
          tmp.19 -> -52,
        }}};
     Asm.Function {name = "decr_j"; global = true;
       instructions =
       [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm -1), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Data "j")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.E, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "if.en.5"));
         (Asm.Mov ((Asm.Data "j"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
         Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Data "j")};
         (Asm.Label "if.en.5"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 21;
         offset = -52;
         stack slots = {
           tmp.0  -> -4,
           tmp.2  -> -8,
           tmp.3  -> -12,
           tmp.4  -> -16,
           tmp.6  -> -20,
           tmp.7  -> -24,
           tmp.8  -> -28,
           tmp.11 -> -32,
           tmp.12 -> -36,
           tmp.14 -> -40,
           tmp.17 -> -44,
           tmp.18 -> -48,
           tmp.19 -> -52,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 64);
         (Asm.Mov ((Asm.Data "i"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Data "i")};
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.E, "cond.el.10"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24))); (Asm.Jmp "cond.en.9");
         (Asm.Label "cond.el.10"); (Asm.Call "incr_i");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -32)));
         (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
         (Asm.Label "cond.en.9"); (Asm.Cmp ((Asm.Imm 3), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.E, "if.en.13"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.13");
         Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Data "j")};
         (Asm.Cmp ((Asm.Imm 0), (Asm.Data "j")));
         (Asm.JmpCC (Asm.E, "cond.el.16")); (Asm.Call "decr_j");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -44)));
         (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -40)));
         (Asm.Jmp "cond.en.15"); (Asm.Label "cond.el.16");
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40))); (Asm.Label "cond.en.15");
         (Asm.Mov ((Asm.Imm -2), (Asm.Stack -48)));
         (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
         (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Data "j")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -52)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.JmpCC (Asm.E, "if.en.20"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.20"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 21;
         offset = -52;
         stack slots = {
           tmp.0  -> -4,
           tmp.2  -> -8,
           tmp.3  -> -12,
           tmp.4  -> -16,
           tmp.6  -> -20,
           tmp.7  -> -24,
           tmp.8  -> -28,
           tmp.11 -> -32,
           tmp.12 -> -36,
           tmp.14 -> -40,
           tmp.17 -> -44,
           tmp.18 -> -48,
           tmp.19 -> -52,
         }}};
     Asm.StaticVariable {name = "i"; global = true; init = 0};
     Asm.StaticVariable {name = "j"; global = true; init = 0}])
