(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "if.en.0"));
        (Asm.Mov ((Asm.Data "foo"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 1;
        offset = -16;
        stack slots = {
          outer.0 -> -4,
          foo.1   -> -8,
          foo     -> -12,
          foo     -> -16,
        }}};
     Asm.StaticVariable {name = "foo"; global = true; init = 3}])
