(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Jmp "end.0");
        (Asm.Mov ((Asm.Imm 10), (Asm.Data "x.1"))); (Asm.Label "end.0");
        (Asm.Mov ((Asm.Data "x.1"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 0;
        offset = -4;
        stack slots = {
          x.1 -> -4,
        }}};
     Asm.StaticVariable {name = "x.1"; global = false; init = 10}])
