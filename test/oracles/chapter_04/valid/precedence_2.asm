(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.NE, "or.tr.1"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.NE, "or.tr.1"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Jmp "or.en.2");
        (Asm.Label "or.tr.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Label "or.en.2"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "and.fl.4"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.E, "and.fl.4"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "and.en.5");
        (Asm.Label "and.fl.4"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Label "and.en.5"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 6;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.3 -> -8,
        }}}
     ])
