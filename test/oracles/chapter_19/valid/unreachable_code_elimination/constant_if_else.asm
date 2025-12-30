(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions = [(Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 40), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 5); dst = (Asm.Stack -12)};
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 4;
         offset = -12;
         stack slots = {
           x.0   -> -4,
           tmp.2 -> -8,
           tmp.3 -> -12,
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
