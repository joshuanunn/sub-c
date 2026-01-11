(Asm.Program
   [Asm.Function {name = "f"; global = true;
      instructions =
      [(Asm.Mov ((Asm.Imm 100), (Asm.Data "global")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "f";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Data "global")));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Data "flag")));
         (Asm.JmpCC (Asm.E, "main.if.en.0")); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Label "main.if.en.0");
         (Asm.Mov ((Asm.Data "global"), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 2;
         offset = -4;
         stack slots = {
           tmp.1 -> -4,
         }}};
     Asm.StaticVariable {name = "flag"; global = true; init = 1};
     Asm.StaticVariable {name = "global"; global = true; init = 0}])
