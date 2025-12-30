(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.CX)));
        (Asm.Shl ((Asm.Reg Asm.CX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 100), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.CX)));
        (Asm.Sar ((Asm.Reg Asm.CX), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -20;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.2 -> -12,
          tmp.3 -> -16,
          tmp.4 -> -20,
        }}}
     ])
