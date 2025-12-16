(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.2")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.2"); (Asm.Mov ((Asm.Imm 8), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Label "swit.br.1"); (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "and.fl.4"));
        (Asm.Cmp ((Asm.Imm 8), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "and.fl.4"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "and.en.5");
        (Asm.Label "and.fl.4"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Label "and.en.5");
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 6;
        offset = -28;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          tmp.0 -> -12,
          a.2   -> -16,
          tmp.1 -> -20,
          tmp.2 -> -24,
          tmp.3 -> -28,
        }}}
     ])
