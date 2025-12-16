(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.E, "and.fl.1"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.E, "and.fl.1"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Jmp "and.en.2");
        (Asm.Label "and.fl.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Label "and.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Unary {op = Asm.BwNot; dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.NE, "or.tr.5"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.NE, "or.tr.5"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "or.en.6");
        (Asm.Label "or.tr.5"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "or.en.6");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -16)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 9;
        offset = -20;
        stack slots = {
          tmp.0 -> -4,
          tmp.3 -> -8,
          tmp.4 -> -12,
          tmp.7 -> -16,
          tmp.8 -> -20,
        }}}
     ])
