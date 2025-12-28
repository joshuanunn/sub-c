(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Jmp "or.tr.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Jmp "or.en.2");
        (Asm.Label "or.tr.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Label "or.en.2"); (Asm.Jmp "or.tr.4");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "or.en.5");
        (Asm.Label "or.tr.4"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Label "or.en.5"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        (Asm.Jmp "or.tr.8"); (Asm.Jmp "or.tr.8");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16))); (Asm.Jmp "or.en.9");
        (Asm.Label "or.tr.8"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Label "or.en.9");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 11;
        offset = -20;
        stack slots = {
          tmp.0  -> -4,
          tmp.3  -> -8,
          tmp.6  -> -12,
          tmp.7  -> -16,
          tmp.10 -> -20,
        }}}
     ])
