(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "main.if.en.0"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "main.if.el.3"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4))); (Asm.Jmp "main.if.en.2");
        (Asm.Label "main.if.el.3"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Label "main.if.en.2"); (Asm.Label "main.if.en.0");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = -8;
        stack slots = {
          a.0   -> -4,
          tmp.1 -> -8,
        }}}
     ])
