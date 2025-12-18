(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "if.el.2"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Jmp "if.en.1"); (Asm.Label "if.el.2");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -8;
        stack slots = {
          x.0   -> -4,
          tmp.0 -> -8,
        }}}
     ])
