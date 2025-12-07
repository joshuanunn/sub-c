(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 0;
        offset = -8;
        stack slots = {
          a.0 -> -4,
          a.1 -> -8,
        }}}
     ])
