(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Jmp "main.or.tr.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Jmp "main.or.en.2");
        (Asm.Label "main.or.tr.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Label "main.or.en.2"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "main.and.fl.4")); (Asm.Jmp "main.and.fl.4");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "main.and.en.5");
        (Asm.Label "main.and.fl.4"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Label "main.and.en.5");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 6;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.3 -> -8,
        }}}
     ])
