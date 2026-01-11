(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 1;
        offset = -8;
        stack slots = {
          to_multiply.0 -> -4,
          tmp.0         -> -8,
        }}}
     ])
