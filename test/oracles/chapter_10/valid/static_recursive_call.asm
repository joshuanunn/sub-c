(Asm.Program
   [Asm.Function {name = "print_alphabet"; global = true;
      instructions =
      [(Asm.AllocateStack 32);
        (Asm.Mov ((Asm.Data "count.1"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 65); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Data "count.1"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -12)};
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "count.1")));
        (Asm.Cmp ((Asm.Imm 26), (Asm.Data "count.1")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.L, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "print_alphabet.if.en.4"));
        (Asm.Call "print_alphabet");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
        (Asm.Label "print_alphabet.if.en.4");
        (Asm.Mov ((Asm.Data "count.1"), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "print_alphabet";
        counter = 6;
        offset = -20;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.2 -> -12,
          tmp.3 -> -16,
          tmp.5 -> -20,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "print_alphabet");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.StaticVariable {name = "count.1"; global = false; init = 0}])
