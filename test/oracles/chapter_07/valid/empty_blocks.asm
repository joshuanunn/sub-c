(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 20), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 20), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 30), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 30), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -16;
        stack slots = {
          ten.0    -> -4,
          twenty.1 -> -8,
          tmp.0    -> -12,
          tmp.1    -> -16,
        }}}
     ])
