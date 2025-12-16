(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Mov ((Asm.Data "foo"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}};
     Asm.StaticVariable {name = "foo"; global = false; init = 3}])
