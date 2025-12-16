(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions =
      [(Asm.Jmp "foo.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "foo.0"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "foo");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}}
     ])
