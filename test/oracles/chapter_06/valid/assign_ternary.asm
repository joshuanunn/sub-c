(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.E, "cond.el.2"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8))); (Asm.Jmp "cond.en.1");
        (Asm.Label "cond.el.2"); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -8)));
        (Asm.Label "cond.en.1");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -8;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
        }}}
     ])
