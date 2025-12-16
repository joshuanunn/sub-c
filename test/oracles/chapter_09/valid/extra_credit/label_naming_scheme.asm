(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Label "_label.0"); (Asm.Label "label_.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}};
     Asm.Function {name = "main_"; global = true;
       instructions =
       [(Asm.Label "label.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame = Env.lenv {
                 counter = 0;
                 offset = 0;
                 stack slots = {
                 }}};
     Asm.Function {name = "_main"; global = true;
       instructions =
       [(Asm.Label "label.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame = Env.lenv {
                 counter = 0;
                 offset = 0;
                 stack slots = {
                 }}}
     ])
