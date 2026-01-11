(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 11), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 11), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 12), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -12;
        stack slots = {
          x.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
        }}}
     ])
