(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Jmp "label.0"); (Asm.Label "loop.ct.1"); (Asm.Jmp "loop.br.1");
        (Asm.Label "label.0"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Jmp "loop.ct.1"); (Asm.Label "loop.br.1");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = -4;
        stack slots = {
          result.1 -> -4,
        }}}
     ])
