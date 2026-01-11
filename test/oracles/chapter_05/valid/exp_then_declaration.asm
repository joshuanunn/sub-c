(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm -2593), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm -2593), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm -1), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm -1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 3;
        offset = -20;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          b.1   -> -16,
          tmp.2 -> -20,
        }}}
     ])
