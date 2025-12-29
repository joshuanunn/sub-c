(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Jmp "main.or.en.2"); (Asm.Label "main.or.tr.1");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Label "main.or.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 3;
        offset = -4;
        stack slots = {
          tmp.0 -> -4,
        }}}
     ])
