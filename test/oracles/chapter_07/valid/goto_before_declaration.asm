(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "if.en.1")); (Asm.Label "return_a.0");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.1"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -12)));
        (Asm.Jmp "return_a.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        counter = 2;
        offset = -12;
        stack slots = {
          a.1   -> -4,
          tmp.0 -> -8,
          a.2   -> -12,
        }}}
     ])
