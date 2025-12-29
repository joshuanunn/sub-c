(Asm.Program
   [Asm.Function {name = "foo"; global = false;
      instructions =
      [(Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "foo";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "foo");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Data "bar"), (Asm.Reg Asm.R10)));
         Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
           dst = (Asm.Stack -8)};
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 2;
         offset = -8;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
         }}};
     Asm.StaticVariable {name = "bar"; global = false; init = 4}])
