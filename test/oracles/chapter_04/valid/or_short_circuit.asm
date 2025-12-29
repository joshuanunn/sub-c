(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Jmp "main.or.tr.2");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.2"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "main.or.en.3");
        (Asm.Label "main.or.tr.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Label "main.or.en.3");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
        }}}
     ])
