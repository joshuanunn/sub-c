(Asm.Program
   [Asm.Function {name = "f"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "total.1")));
        (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.G, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "f.if.en.1"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "f.if.en.1");
        (Asm.Mov ((Asm.Imm 10), (Asm.Data "total.1")));
        (Asm.Call "indirect_update");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Data "total.1"), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "f";
        counter = 3;
        offset = -12;
        stack slots = {
          tmp.0       -> -4,
          tmp.2       -> -8,
          new_total.0 -> -12,
        }}};
     Asm.Function {name = "indirect_update"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 101), (Asm.Reg Asm.DI)));
         (Asm.Call "f"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "indirect_update";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Call "f"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "total.1"; global = false; init = 0}])
