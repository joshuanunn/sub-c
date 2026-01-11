(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 1;
        offset = -12;
        stack slots = {
          tmp.0 -> -4,
          a.0   -> -8,
          b.1   -> -12,
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "target.if.el.1"));
         (Asm.Mov ((Asm.Imm 20), (Asm.Data "y.4")));
         (Asm.Mov ((Asm.Imm 20), (Asm.Data "x.3")));
         (Asm.Jmp "target.if.en.0"); (Asm.Label "target.if.el.1");
         (Asm.Mov ((Asm.Imm 100), (Asm.Data "y.4")));
         (Asm.Mov ((Asm.Imm 100), (Asm.Data "x.3")));
         (Asm.Label "target.if.en.0");
         (Asm.Mov ((Asm.Data "y.4"), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Data "y.4"), (Asm.Reg Asm.SI))); (Asm.Call "callee");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 3;
         offset = -8;
         stack slots = {
           tmp.2  -> -4,
           flag.2 -> -8,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.DI)));
         (Asm.Call "target"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 200), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI))); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 40), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.JmpCC (Asm.E, "main.if.en.5"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.5");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 6;
         offset = -20;
         stack slots = {
           result.5 -> -4,
           tmp.0    -> -8,
           tmp.1    -> -12,
           tmp.3    -> -16,
           tmp.4    -> -20,
         }}};
     Asm.StaticVariable {name = "x.3"; global = false; init = 0};
     Asm.StaticVariable {name = "y.4"; global = false; init = 0}])
