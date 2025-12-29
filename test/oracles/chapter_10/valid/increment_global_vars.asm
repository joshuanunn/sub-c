(Asm.Program
   [Asm.Function {name = "incr_i"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Cmp ((Asm.Imm 1), (Asm.Data "i")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "incr_i.if.en.1"));
        (Asm.Mov ((Asm.Data "i"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Data "i")};
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Data "i")};
        (Asm.Label "incr_i.if.en.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "incr_i";
        counter = 3;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.2 -> -8,
        }}};
     Asm.Function {name = "decr_j"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm -1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Data "j")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "decr_j.if.en.2"));
         (Asm.Mov ((Asm.Data "j"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Data "j")};
         (Asm.Label "decr_j.if.en.2");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "decr_j";
         counter = 4;
         offset = -12;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
           tmp.3 -> -12,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32);
         (Asm.Mov ((Asm.Data "i"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Data "i")};
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.cond.el.3"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Jmp "main.cond.en.2");
         (Asm.Label "main.cond.el.3"); (Asm.Call "incr_i");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Label "main.cond.en.2");
         (Asm.Cmp ((Asm.Imm 3), (Asm.Data "i")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "main.if.en.6"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.6");
         Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Data "j")};
         (Asm.Cmp ((Asm.Imm 0), (Asm.Data "j")));
         (Asm.JmpCC (Asm.E, "main.cond.el.9")); (Asm.Call "decr_j");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
         (Asm.Jmp "main.cond.en.8"); (Asm.Label "main.cond.el.9");
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.Label "main.cond.en.8");
         (Asm.Mov ((Asm.Imm -2), (Asm.Stack -28)));
         (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
         (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Data "j")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.E, "main.if.en.13"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.13");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 14;
         offset = -32;
         stack slots = {
           tmp.0  -> -4,
           tmp.1  -> -8,
           tmp.4  -> -12,
           tmp.5  -> -16,
           tmp.7  -> -20,
           tmp.10 -> -24,
           tmp.11 -> -28,
           tmp.12 -> -32,
         }}};
     Asm.StaticVariable {name = "i"; global = true; init = 0};
     Asm.StaticVariable {name = "j"; global = true; init = 0}])
