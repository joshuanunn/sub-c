(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 72), (Asm.Reg Asm.DI)));
        (Asm.Call "putchar"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 101), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 108), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 108), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 111), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 44), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Imm 32), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 87), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 111), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 114), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -40)));
        (Asm.Mov ((Asm.Imm 108), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -44)));
        (Asm.Mov ((Asm.Imm 100), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Imm 33), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 14;
        offset = -56;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.3  -> -16,
          tmp.4  -> -20,
          tmp.5  -> -24,
          tmp.6  -> -28,
          tmp.7  -> -32,
          tmp.8  -> -36,
          tmp.9  -> -40,
          tmp.10 -> -44,
          tmp.11 -> -48,
          tmp.12 -> -52,
          tmp.13 -> -56,
        }}}
     ])
