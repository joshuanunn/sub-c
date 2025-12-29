(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Jmp "x.0"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "x.0");
        (Asm.Mov ((Asm.Data "x"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 0;
        offset = -4;
        stack slots = {
          x.1 -> -4,
        }}};
     Asm.StaticVariable {name = "x"; global = true; init = 0}])
