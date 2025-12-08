(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 2); dst = (Asm.Stack -4)};
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
