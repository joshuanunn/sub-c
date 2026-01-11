(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "main.and.fl.4"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "main.and.fl.4"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24))); (Asm.Jmp "main.and.en.5");
        (Asm.Label "main.and.fl.4");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.Label "main.and.en.5");
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 6;
        offset = -24;
        stack slots = {
          x.0   -> -4,
          y.1   -> -8,
          tmp.0 -> -12,
          tmp.1 -> -16,
          tmp.2 -> -20,
          tmp.3 -> -24,
        }}}
     ])
