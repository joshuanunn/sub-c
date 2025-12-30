(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.SetCC (Asm.E, (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "main.and.fl.5"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "main.and.fl.5"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36))); (Asm.Jmp "main.and.en.6");
        (Asm.Label "main.and.fl.5");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Label "main.and.en.6");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "main.and.fl.9"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "main.and.fl.9"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44))); (Asm.Jmp "main.and.en.10");
        (Asm.Label "main.and.fl.9");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Label "main.and.en.10");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "main.and.fl.13"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.SetCC (Asm.E, (Asm.Stack -48)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.JmpCC (Asm.E, "main.and.fl.13"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -52))); (Asm.Jmp "main.and.en.14");
        (Asm.Label "main.and.fl.13");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.Label "main.and.en.14");
        (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 15;
        offset = -52;
        stack slots = {
          a.0    -> -4,
          b.1    -> -8,
          c.2    -> -12,
          tmp.0  -> -16,
          d.3    -> -20,
          tmp.1  -> -24,
          tmp.2  -> -28,
          tmp.3  -> -32,
          tmp.4  -> -36,
          tmp.7  -> -40,
          tmp.8  -> -44,
          tmp.11 -> -48,
          tmp.12 -> -52,
        }}}
     ])
