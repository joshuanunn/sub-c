(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions = [(Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "foo";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
         (Asm.Call "foo"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -8;
         stack slots = {
           x.0   -> -4,
           tmp.0 -> -8,
         }}}
     ])
