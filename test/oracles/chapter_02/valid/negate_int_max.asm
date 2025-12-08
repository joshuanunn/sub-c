(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16);
        (Asm.Mov ((Asm.Imm 2147483647), (Asm.Stack -4)));
        Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 1;
        offset = -4;
        stack slots = {
          tmp.0 -> -4,
        }}}
     ])
