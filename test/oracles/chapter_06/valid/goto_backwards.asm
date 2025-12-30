(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Jmp "main.if.en.0"); (Asm.Label "label.0");
        (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "main.if.en.0"); (Asm.Jmp "label.0")];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 1;
        offset = 0;
        stack slots = {
        }}}
     ])
