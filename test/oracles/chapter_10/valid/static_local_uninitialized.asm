(Asm.Program
   [Asm.Function {name = "foo"; global = true;
      instructions =
      [(Asm.AllocateStack 16);
        (Asm.Mov ((Asm.Data "x.0"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "x.0")));
        (Asm.Mov ((Asm.Data "x.0"), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "foo";
        counter = 1;
        offset = -4;
        stack slots = {
          tmp.0 -> -4,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.Label "loop.st.1"); (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.L, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Call "foo");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 3;
         offset = -20;
         stack slots = {
           ret.1 -> -4,
           i.2   -> -8,
           tmp.0 -> -12,
           tmp.1 -> -16,
           tmp.2 -> -20,
         }}};
     Asm.StaticVariable {name = "x.0"; global = false; init = 0}])
