(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Jmp "if.en.0"); (Asm.Label "label.0");
        (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.0"); (Asm.Jmp "label.0");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 1;
                offset = 0;
                stack slots = {
                }}}
     ])
