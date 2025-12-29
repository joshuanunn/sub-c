(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 100), (Asm.Stack -16))); (Asm.Label "loop.st.1");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.G, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "loop.br.1"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -32)};
        (Asm.Mov ((Asm.Stack -32), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Stack -28), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Label "loop.ct.1");
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -36)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -36)};
        (Asm.Mov ((Asm.Stack -36), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        (Asm.Jmp "loop.st.1"); (Asm.Label "loop.br.1");
        (Asm.Cmp ((Asm.Imm 101), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "main.and.fl.6"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.SetCC (Asm.E, (Asm.Stack -44)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.JmpCC (Asm.E, "main.and.fl.6"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -48))); (Asm.Jmp "main.and.en.7");
        (Asm.Label "main.and.fl.6");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.Label "main.and.en.7");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
        (Asm.JmpCC (Asm.E, "main.and.fl.10"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.SetCC (Asm.E, (Asm.Stack -52)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "main.and.fl.10"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -56))); (Asm.Jmp "main.and.en.11");
        (Asm.Label "main.and.fl.10");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.Label "main.and.en.11");
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 12;
        offset = -56;
        stack slots = {
          i.0   -> -4,
          j.1   -> -8,
          k.2   -> -12,
          i.3   -> -16,
          tmp.0 -> -20,
          i.4   -> -24,
          j.5   -> -28,
          tmp.1 -> -32,
          tmp.2 -> -36,
          tmp.3 -> -40,
          tmp.4 -> -44,
          tmp.5 -> -48,
          tmp.8 -> -52,
          tmp.9 -> -56,
        }}}
     ])
