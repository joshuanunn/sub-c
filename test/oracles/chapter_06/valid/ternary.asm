(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm -1), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.G, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "main.cond.el.4"));
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -8))); (Asm.Jmp "main.cond.en.3");
        (Asm.Label "main.cond.el.4");
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Label "main.cond.en.3");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -16;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          tmp.2 -> -16,
        }}}
     ])
