(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16);
        (Asm.Mov ((Asm.Imm -2147483647), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 2147483646), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 2147483646), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
        }}}
     ])
