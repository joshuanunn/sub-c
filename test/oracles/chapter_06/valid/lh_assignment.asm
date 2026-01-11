(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "main.and.fl.6"));
        (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "main.and.fl.6"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24))); (Asm.Jmp "main.and.en.7");
        (Asm.Label "main.and.fl.6");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.Label "main.and.en.7");
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 8;
        offset = -24;
        stack slots = {
          x.0   -> -4,
          y.1   -> -8,
          tmp.0 -> -12,
          tmp.3 -> -16,
          tmp.4 -> -20,
          tmp.5 -> -24,
        }}}
     ])
