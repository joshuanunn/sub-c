(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "main.cond.el.3"));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -16))); (Asm.Jmp "main.cond.en.2");
        (Asm.Label "main.cond.el.3");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "main.cond.el.6"));
        (Asm.Mov ((Asm.Imm 6), (Asm.Stack -24))); (Asm.Jmp "main.cond.en.5");
        (Asm.Label "main.cond.el.6");
        (Asm.Mov ((Asm.Imm 7), (Asm.Stack -24)));
        (Asm.Label "main.cond.en.5");
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Label "main.cond.en.2");
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 7;
        offset = -24;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          flag.2 -> -12,
          tmp.0  -> -16,
          tmp.1  -> -20,
          tmp.4  -> -24,
        }}}
     ])
