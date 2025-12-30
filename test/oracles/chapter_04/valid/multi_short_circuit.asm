(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "main.or.tr.5"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "main.or.en.6");
        (Asm.Label "main.or.tr.5"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "main.or.en.6");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret];
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
