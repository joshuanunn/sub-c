(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 66), (Asm.Reg Asm.DI)));
        (Asm.Call "putchar"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
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
