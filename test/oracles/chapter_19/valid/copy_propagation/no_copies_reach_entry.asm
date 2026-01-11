(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "target.if.en.0"));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "target.if.en.0");
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 1;
        offset = -8;
        stack slots = {
          a.0    -> -4,
          flag.1 -> -8,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.SI))); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}}
     ])
