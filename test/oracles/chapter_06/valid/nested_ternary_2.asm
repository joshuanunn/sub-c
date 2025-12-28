(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -12)));
        (Asm.Jmp "cond.en.4"); (Asm.Label "cond.el.5");
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -12))); (Asm.Label "cond.en.4");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8))); (Asm.Jmp "cond.en.1");
        (Asm.Label "cond.el.2"); (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Label "cond.en.1");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4))); (Asm.Jmp "cond.el.8");
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -24))); (Asm.Jmp "cond.en.10");
        (Asm.Label "cond.el.11"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -24)));
        (Asm.Label "cond.en.10");
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Jmp "cond.en.7"); (Asm.Label "cond.el.8");
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -20))); (Asm.Label "cond.en.7");
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Stack -16);
          dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 13;
        offset = -28;
        stack slots = {
          a.0    -> -4,
          tmp.0  -> -8,
          tmp.3  -> -12,
          b.1    -> -16,
          tmp.6  -> -20,
          tmp.9  -> -24,
          tmp.12 -> -28,
        }}}
     ])
