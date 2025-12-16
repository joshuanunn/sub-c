(Asm.Program
   [Asm.Function {name = "three"; global = true;
      instructions =
      [(Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "three");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 2;
         offset = -8;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
         }}}
     ])
