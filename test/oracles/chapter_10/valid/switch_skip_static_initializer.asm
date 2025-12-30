(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Cmp ((Asm.Imm 1), (Asm.Data "a")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.1"));
        (Asm.Cmp ((Asm.Imm 3), (Asm.Data "a")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.3")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Data "x.0")));
        (Asm.Label "swit.cs.1.3");
        (Asm.Mov ((Asm.Data "x.0"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.br.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
        }}};
     Asm.StaticVariable {name = "x.0"; global = false; init = 10};
     Asm.StaticVariable {name = "a"; global = true; init = 3}])
