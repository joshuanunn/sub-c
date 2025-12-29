(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Jmp "main.or.tr.2");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.2"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "main.or.en.3");
        (Asm.Label "main.or.tr.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "main.or.en.3");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Jmp "main.and.fl.6");
        (Asm.Mov ((Asm.Imm 100), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "main.and.fl.6"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24))); (Asm.Jmp "main.and.en.7");
        (Asm.Label "main.and.fl.6");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.Label "main.and.en.7");
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Jmp "main.cond.el.10");
        (Asm.Mov ((Asm.Imm 2147483657), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        (Asm.Jmp "main.cond.en.9"); (Asm.Label "main.cond.el.10");
        (Asm.Mov ((Asm.Imm 100), (Asm.Stack -32)));
        (Asm.Label "main.cond.en.9");
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "main.if.en.13"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.13");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "main.if.en.15"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.15");
        (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.JmpCC (Asm.E, "main.if.en.17"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.17");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 18;
        offset = -48;
        stack slots = {
          dead_div_by_zero.0    -> -4,
          tmp.0                 -> -8,
          tmp.1                 -> -12,
          dead_zero_remainder.1 -> -16,
          tmp.4                 -> -20,
          tmp.5                 -> -24,
          overflow.2            -> -28,
          tmp.8                 -> -32,
          tmp.11                -> -36,
          tmp.12                -> -40,
          tmp.14                -> -44,
          tmp.16                -> -48,
        }}}
     ])
