(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions = [(Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 0;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 16);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.SetCC (Asm.E, (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.JmpCC (Asm.NE, "swit.cs.1.1")); (Asm.Jmp "swit.df.1");
         (Asm.Label "swit.cs.1.1");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "swit.df.1"); (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX)));
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 2;
         offset = -12;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           x.0   -> -12,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Call "target"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
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
