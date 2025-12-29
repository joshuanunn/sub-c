(Asm.Program
   [Asm.Function {name = "update_static_or_global"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "if.el.1"));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "i"))); (Asm.Jmp "if.en.0");
        (Asm.Label "if.el.1"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "i.2")));
        (Asm.Label "if.en.0");
        (Asm.Mov ((Asm.Data "i.2"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 19;
        offset = -52;
        stack slots = {
          update_global.0 -> -4,
          new_val.1       -> -8,
          tmp.2           -> -12,
          result.3        -> -16,
          tmp.4           -> -20,
          tmp.5           -> -24,
          tmp.7           -> -28,
          tmp.9           -> -32,
          tmp.10          -> -36,
          tmp.12          -> -40,
          tmp.14          -> -44,
          tmp.15          -> -48,
          tmp.17          -> -52,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 64); (Asm.Cmp ((Asm.Imm 0), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "if.en.3"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.3"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.SI)));
         (Asm.Call "update_static_or_global");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.JmpCC (Asm.E, "if.en.6"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.6"); (Asm.Cmp ((Asm.Imm 10), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.E, "if.en.8"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.8"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.SI)));
         (Asm.Call "update_static_or_global");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -32)));
         (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 9), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.E, "if.en.11"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.11"); (Asm.Cmp ((Asm.Imm 10), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.E, "if.en.13"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.13"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 11), (Asm.Reg Asm.SI)));
         (Asm.Call "update_static_or_global");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -44)));
         (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 9), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.JmpCC (Asm.E, "if.en.16"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.16"); (Asm.Cmp ((Asm.Imm 11), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -52)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.JmpCC (Asm.E, "if.en.18"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.18"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 19;
         offset = -52;
         stack slots = {
           update_global.0 -> -4,
           new_val.1       -> -8,
           tmp.2           -> -12,
           result.3        -> -16,
           tmp.4           -> -20,
           tmp.5           -> -24,
           tmp.7           -> -28,
           tmp.9           -> -32,
           tmp.10          -> -36,
           tmp.12          -> -40,
           tmp.14          -> -44,
           tmp.15          -> -48,
           tmp.17          -> -52,
         }}};
     Asm.StaticVariable {name = "i"; global = true; init = 0};
     Asm.StaticVariable {name = "i.2"; global = false; init = 0}])
