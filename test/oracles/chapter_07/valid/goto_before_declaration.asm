(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "main.if.en.1");
        (Asm.Label "return_a.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "main.if.en.1");
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -12))); (Asm.Jmp "return_a.0")];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -12;
        stack slots = {
          a.1   -> -4,
          tmp.0 -> -8,
          a.2   -> -12,
        }}}
     ])
