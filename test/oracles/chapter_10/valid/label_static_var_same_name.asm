(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 5), (Asm.Data "x.1")));
        (Asm.Jmp "x.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Data "x.1")));
        (Asm.Label "x.0"); (Asm.Mov ((Asm.Data "x.1"), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 0;
        offset = -4;
        stack slots = {
          x.1 -> -4,
        }}};
     Asm.StaticVariable {name = "x.1"; global = false; init = 5}])
