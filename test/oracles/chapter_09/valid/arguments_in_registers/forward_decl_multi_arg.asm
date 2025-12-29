(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.DI)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "foo");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 1;
        offset = -4;
        stack slots = {
          tmp.0 -> -4,
        }}};
     Asm.Function {name = "foo"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Sub; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -4)};
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "foo";
         counter = 1;
         offset = -12;
         stack slots = {
           tmp.0 -> -4,
           x.2   -> -8,
           y.3   -> -12,
         }}}
     ])
