(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16);
        (Asm.Mov ((Asm.Data "j.1"), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Data "i.0")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.L, (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "if.en.2"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -12;
        stack slots = {
          cmp.2 -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
        }}};
     Asm.StaticVariable {name = "i.0"; global = false; init = 2};
     Asm.StaticVariable {name = "j.1"; global = false; init = 3}])
