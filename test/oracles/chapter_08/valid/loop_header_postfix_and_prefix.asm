(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 100), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Label "loop.ct.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Jmp "loop.ct.1"); (Asm.Label "loop.br.1");
        (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "if.en.3"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.3"); (Asm.Mov ((Asm.Imm 100), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Label "loop.ct.2");
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "loop.br.2"));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Jmp "loop.ct.2"); (Asm.Label "loop.br.2");
        (Asm.Cmp ((Asm.Imm 99), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "if.en.6"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.6"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 7;
        offset = -28;
        stack slots = {
          i.0     -> -4,
          count.1 -> -8,
          tmp.0   -> -12,
          tmp.1   -> -16,
          tmp.2   -> -20,
          tmp.4   -> -24,
          tmp.5   -> -28,
        }}}
     ])
