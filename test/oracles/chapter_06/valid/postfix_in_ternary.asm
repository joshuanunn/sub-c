(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "main.cond.el.3"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "main.cond.en.2");
        (Asm.Label "main.cond.el.3");
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 9), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -8)));
        (Asm.Label "main.cond.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -16;
        stack slots = {
          x.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          tmp.4 -> -16,
        }}}
     ])
