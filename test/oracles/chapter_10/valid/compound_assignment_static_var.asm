(Asm.Program
   [Asm.Function {name = "f"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 0), (Asm.Data "i.0")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Data "j.1")));
        (Asm.Mov ((Asm.Imm 1), (Asm.Data "k.2")));
        (Asm.Mov ((Asm.Imm 48), (Asm.Data "l.3")));
        (Asm.Mov ((Asm.Data "i.0"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "i.0")));
        (Asm.Mov ((Asm.Data "j.1"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Data "i.0"), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -24)};
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "j.1")));
        (Asm.Mov ((Asm.Data "k.2"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Data "j.1");
          dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "k.2")));
        (Asm.Mov ((Asm.Data "l.3"), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "l.3")));
        (Asm.Cmp ((Asm.Imm 3), (Asm.Data "i.0")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "if.en.5"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.5"); (Asm.Mov ((Asm.Imm 6), (Asm.Stack -40)));
        Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -40)};
        (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Data "j.1")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "if.en.8"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.8"); (Asm.Mov ((Asm.Imm 18), (Asm.Stack -48)));
        Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -48)};
        (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Data "k.2")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "if.en.11"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.11"); (Asm.Cmp ((Asm.Imm 6), (Asm.Data "l.3")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.JmpCC (Asm.E, "if.en.13"));
        (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.13"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 14;
        offset = -56;
        stack slots = {
          i.0    -> -4,
          j.1    -> -8,
          k.2    -> -12,
          l.3    -> -16,
          tmp.0  -> -20,
          tmp.1  -> -24,
          tmp.2  -> -28,
          tmp.3  -> -32,
          tmp.4  -> -36,
          tmp.6  -> -40,
          tmp.7  -> -44,
          tmp.9  -> -48,
          tmp.10 -> -52,
          tmp.12 -> -56,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4))); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8))); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 3;
         offset = -12;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.2 -> -12,
         }}};
     Asm.StaticVariable {name = "l.3"; global = false; init = 48};
     Asm.StaticVariable {name = "k.2"; global = false; init = 1};
     Asm.StaticVariable {name = "i.0"; global = false; init = 0};
     Asm.StaticVariable {name = "j.1"; global = false; init = 0}])
