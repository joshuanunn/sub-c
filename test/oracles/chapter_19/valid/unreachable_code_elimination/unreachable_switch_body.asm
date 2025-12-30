(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 7;
        offset = -36;
        stack slots = {
          i.2    -> -4,
          tmp.0  -> -8,
          tmp.1  -> -12,
          tmp.2  -> -16,
          tmp.3  -> -20,
          tmp.4  -> -24,
          tmp.5  -> -28,
          tmp.6  -> -32,
          flag.0 -> -36,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 20), (Asm.Reg Asm.DI)));
         (Asm.Call "target"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "x.1"; global = false; init = 0}])
