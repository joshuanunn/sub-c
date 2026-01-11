(Asm.Program
   [Asm.Function {name = "target"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.1"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.2")); (Asm.Jmp "swit.df.1");
        (Asm.Label "swit.cs.1.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Label "swit.cs.1.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.df.1"); (Asm.Mov ((Asm.Imm -1), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target";
        counter = 3;
        offset = -20;
        stack slots = {
          retval.1 -> -4,
          tmp.0    -> -8,
          tmp.1    -> -12,
          tmp.2    -> -16,
          flag.0   -> -20,
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
