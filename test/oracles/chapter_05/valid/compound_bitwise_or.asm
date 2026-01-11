(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 31), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 31), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 31), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 1;
        offset = -8;
        stack slots = {
          to_or.0 -> -4,
          tmp.0   -> -8,
        }}}
     ])
