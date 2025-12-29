(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Jmp "main.and.fl.2");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "main.and.fl.2"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "main.and.en.3");
        (Asm.Label "main.and.fl.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Label "main.and.en.3"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.5"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "main.or.en.6");
        (Asm.Label "main.or.tr.5"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "main.or.en.6");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 7;
        offset = -12;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.4 -> -12,
        }}}
     ])
