(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions = [(Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX)));
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 4;
         offset = -20;
         stack slots = {
           x.0   -> -4,
           tmp.0 -> -8,
           y.1   -> -12,
           tmp.2 -> -16,
           tmp.3 -> -20,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}}
     ])
