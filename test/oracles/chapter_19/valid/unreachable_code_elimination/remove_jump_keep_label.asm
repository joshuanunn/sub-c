(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Data "x"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "x")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 1;
        offset = -4;
        stack slots = {
          tmp.0 -> -4,
        }}};
     Asm.Function {name = "f"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Label "loop.st.1"); (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.L, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Call "callee");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -16)};
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "f";
         counter = 4;
         offset = -16;
         stack slots = {
           i.0   -> -4,
           tmp.0 -> -8,
           tmp.2 -> -12,
           tmp.3 -> -16,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "f");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Data "x"), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "x"; global = true; init = 0}])
