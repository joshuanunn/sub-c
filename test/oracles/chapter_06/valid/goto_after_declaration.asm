(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "main.and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "main.and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20))); (Asm.Jmp "main.and.en.4");
        (Asm.Label "main.and.fl.3");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Label "main.and.en.4");
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 5;
        offset = -20;
        stack slots = {
          x.1   -> -4,
          i.2   -> -8,
          tmp.0 -> -12,
          tmp.1 -> -16,
          tmp.2 -> -20,
        }}}
     ])
