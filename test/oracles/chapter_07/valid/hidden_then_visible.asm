(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 48); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm -4), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 7), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 8), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "main.and.fl.6"));
        (Asm.Mov ((Asm.Imm -4), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "main.and.fl.6"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36))); (Asm.Jmp "main.and.en.7");
        (Asm.Label "main.and.fl.6");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Label "main.and.en.7");
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 8;
        offset = -36;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          tmp.0 -> -12,
          a.2   -> -16,
          tmp.1 -> -20,
          tmp.2 -> -24,
          tmp.3 -> -28,
          tmp.4 -> -32,
          tmp.5 -> -36,
        }}}
     ])
