(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 8), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -12;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          tmp.4 -> -12,
        }}}
     ])
