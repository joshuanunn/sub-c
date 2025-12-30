(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Mov ((Asm.Data "x.1"), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.StaticVariable {name = "x.1"; global = false; init = 5}])
