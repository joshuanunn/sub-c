(Asm.Program
   [Asm.Function {name = "print_letters"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 65), (Asm.Data "i.1")));
        (Asm.Mov ((Asm.Data "i.1"), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Data "i.1"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -12)};
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "i.1")));
        (Asm.Mov ((Asm.Imm 97), (Asm.Data "i.2")));
        (Asm.Mov ((Asm.Data "i.2"), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Data "i.2"), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -24)};
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "i.2")));
        (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.DI))); (Asm.Call "putchar");
        (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 5;
        offset = -28;
        stack slots = {
          i.1   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          i.2   -> -16,
          tmp.2 -> -20,
          tmp.3 -> -24,
          tmp.4 -> -28,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Label "loop.st.1"); (Asm.Cmp ((Asm.Imm 26), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.L, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Call "print_letters");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Label "loop.ct.1");
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -16)};
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         counter = 3;
         offset = -16;
         stack slots = {
           i.3   -> -4,
           tmp.0 -> -8,
           tmp.1 -> -12,
           tmp.2 -> -16,
         }}};
     Asm.StaticVariable {name = "i.1"; global = false; init = 65};
     Asm.StaticVariable {name = "i.2"; global = false; init = 97}])
