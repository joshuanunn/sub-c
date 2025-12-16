(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Call "update_x");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Data "x")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.0"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Data "x")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.1"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Data "x")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.4")); (Asm.Jmp "swit.df.1");
        (Asm.Label "swit.cs.1.0"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.cs.1.1");
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.cs.1.4"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.df.1");
        (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.br.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        counter = 4;
        offset = -20;
        stack slots = {
          tmp.0 -> -4,
          x     -> -8,
          tmp.1 -> -12,
          tmp.2 -> -16,
          tmp.3 -> -20,
        }}};
     Asm.Function {name = "update_x"; global = true;
       instructions =
       [(Asm.Mov ((Asm.Imm 4), (Asm.Data "x")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame = Env.lenv {
                 counter = 0;
                 offset = 0;
                 stack slots = {
                 }}};
     Asm.StaticVariable {name = "x"; global = true; init = 0}])
