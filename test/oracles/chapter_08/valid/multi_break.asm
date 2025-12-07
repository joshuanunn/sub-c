(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Label "loop.ct.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.G, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "if.en.2")); (Asm.Jmp "loop.br.1");
        (Asm.Label "if.en.2"); (Asm.Jmp "loop.ct.1");
        (Asm.Label "loop.br.1"); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -16)));
        (Asm.Label "loop.ct.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.E, "loop.br.2"));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.L, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "if.en.5")); (Asm.Jmp "loop.br.2");
        (Asm.Label "if.en.5"); (Asm.Jmp "loop.ct.2");
        (Asm.Label "loop.br.2"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32)));
        Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -32)};
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.SetCC (Asm.E, (Asm.Stack -36)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "and.fl.10"));
        (Asm.Cmp ((Asm.Imm 11), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "and.fl.10"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44))); (Asm.Jmp "and.en.11");
        (Asm.Label "and.fl.10"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Label "and.en.11");
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 12;
        offset = -44;
        stack slots = {
          i.0      -> -4,
          tmp.0    -> -8,
          tmp.1    -> -12,
          j.1      -> -16,
          tmp.3    -> -20,
          tmp.4    -> -24,
          result.2 -> -28,
          tmp.6    -> -32,
          tmp.7    -> -36,
          tmp.8    -> -40,
          tmp.9    -> -44,
        }}}
     ])
