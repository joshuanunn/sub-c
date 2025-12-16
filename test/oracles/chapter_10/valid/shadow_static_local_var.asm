(Asm.Program
   [Asm.Function {name = "update_static_or_global"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -4)));
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
        counter = 2;
        offset = -8;
        stack slots = {
          update_global.0 -> -4,
          new_val.1       -> -8,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 48); (Asm.Cmp ((Asm.Imm 0), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.JmpCC (Asm.E, "if.en.1"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.SI)));
         (Asm.Call "update_static_or_global");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "if.en.4"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.4"); (Asm.Cmp ((Asm.Imm 10), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.JmpCC (Asm.E, "if.en.6"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.6"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.SI)));
         (Asm.Call "update_static_or_global");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 9), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.E, "if.en.9"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.9"); (Asm.Cmp ((Asm.Imm 10), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.E, "if.en.11"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.11"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 11), (Asm.Reg Asm.SI)));
         (Asm.Call "update_static_or_global");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -36)));
         (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 9), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.E, "if.en.14"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.14"); (Asm.Cmp ((Asm.Imm 11), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -44)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.JmpCC (Asm.E, "if.en.16"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "if.en.16"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 17;
         offset = -44;
         stack slots = {
           tmp.0    -> -4,
           result.3 -> -8,
           tmp.2    -> -12,
           tmp.3    -> -16,
           tmp.5    -> -20,
           tmp.7    -> -24,
           tmp.8    -> -28,
           tmp.10   -> -32,
           tmp.12   -> -36,
           tmp.13   -> -40,
           tmp.15   -> -44,
         }}};
     Asm.StaticVariable {name = "i"; global = true; init = 0};
     Asm.StaticVariable {name = "i.2"; global = false; init = 0}])
