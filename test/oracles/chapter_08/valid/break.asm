(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 20), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm -20), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Label "loop.st.1"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.L, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.LE, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "if.en.4")); (Asm.Jmp "loop.br.1");
        (Asm.Label "if.en.4"); (Asm.Label "loop.ct.1");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -28)};
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8))); (Asm.Jmp "loop.st.1");
        (Asm.Label "loop.br.1"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "and.fl.10"));
        (Asm.Mov ((Asm.Imm -11), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "and.fl.10"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44))); (Asm.Jmp "and.en.11");
        (Asm.Label "and.fl.10"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Label "and.en.11");
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 12;
        offset = -44;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          tmp.0 -> -12,
          tmp.1 -> -16,
          tmp.2 -> -20,
          tmp.3 -> -24,
          tmp.5 -> -28,
          tmp.6 -> -32,
          tmp.7 -> -36,
          tmp.8 -> -40,
          tmp.9 -> -44,
        }}}
     ])
