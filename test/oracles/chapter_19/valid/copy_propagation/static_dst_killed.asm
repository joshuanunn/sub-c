(Asm.Program
   [Asm.Function {name = "update_x"; global = true;
      instructions =
      [(Asm.Mov ((Asm.Imm 4), (Asm.Data "x")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "update_x";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 3), (Asm.Data "x")));
         (Asm.Call "update_x"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Data "x"), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2"); (Asm.Cmp ((Asm.Imm 4), (Asm.Data "x")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "main.if.en.4"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.4");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 5;
         offset = -12;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.3 -> -12,
         }}};
     Asm.StaticVariable {name = "x"; global = true; init = 0}])
