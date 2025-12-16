(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.Jmp "x.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Data "x.1")));
        (Asm.Label "x.0"); (Asm.Mov ((Asm.Data "x.1"), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame = Env.lenv {
                counter = 0;
                offset = 0;
                stack slots = {
                }}};
     Asm.StaticVariable {name = "x.1"; global = false; init = 5}])
