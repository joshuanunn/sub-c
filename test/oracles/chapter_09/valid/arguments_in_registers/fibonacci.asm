(Asm.Program
   [Asm.Function {name = "fib"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "fib.or.tr.3"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "fib.or.tr.3"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Jmp "fib.or.en.4");
        (Asm.Label "fib.or.tr.3"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Label "fib.or.en.4"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "fib.if.el.6"));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "fib.if.el.6");
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -16)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.DI))); (Asm.Call "fib");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 2); dst = (Asm.Stack -24)};
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.DI))); (Asm.Call "fib");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "fib";
        counter = 12;
        offset = -36;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.7  -> -16,
          tmp.8  -> -20,
          tmp.9  -> -24,
          tmp.10 -> -28,
          tmp.11 -> -32,
          n.0    -> -36,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 6), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.DI))); (Asm.Call "fib");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -8;
         stack slots = {
           n.1   -> -4,
           tmp.0 -> -8,
         }}}
     ])
