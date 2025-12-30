(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions = [(Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = 0;
        stack slots = {
        }}}
     ])
