(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "and.fl.3"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "and.en.4");
        (Asm.Label "and.fl.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Label "and.en.4"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "and.fl.7"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "and.fl.7"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36))); (Asm.Jmp "and.en.8");
        (Asm.Label "and.fl.7"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Label "and.en.8"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "and.fl.11"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44))); (Asm.Jmp "and.en.12");
        (Asm.Label "and.fl.11"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Label "and.en.12");
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 13;
        offset = -44;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          d.3    -> -16,
          tmp.0  -> -20,
          tmp.1  -> -24,
          tmp.2  -> -28,
          tmp.5  -> -32,
          tmp.6  -> -36,
          tmp.9  -> -40,
          tmp.10 -> -44,
        }}}
     ])
