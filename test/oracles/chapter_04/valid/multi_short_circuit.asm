(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.NE, "or.tr.5"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.E, "and.fl.2"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Cdq;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R10)));
        (Asm.Idiv (Asm.Reg Asm.R10));
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "and.fl.2"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "and.en.3");
        (Asm.Label "and.fl.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Label "and.en.3"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "or.tr.5"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "or.en.6");
        (Asm.Label "or.tr.5"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "or.en.6"); (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 7;
        offset = -12;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.4 -> -12,
        }}}
     ])
