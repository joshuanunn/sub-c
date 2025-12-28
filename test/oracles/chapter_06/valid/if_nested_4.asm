(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "if.en.1"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "if.el.4"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4))); (Asm.Jmp "if.en.3");
        (Asm.Label "if.el.4"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4))); (Asm.Label "if.en.3");
        (Asm.Label "if.en.1"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 6;
        offset = -16;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.2 -> -12,
          tmp.5 -> -16,
        }}}
     ])
