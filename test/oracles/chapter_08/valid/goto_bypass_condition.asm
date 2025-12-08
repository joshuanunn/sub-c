(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Label "loop.st.1"); (Asm.Label "while_start.0");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.L, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "if.en.2")); (Asm.Jmp "while_start.0");
        (Asm.Label "if.en.2"); (Asm.Label "loop.ct.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.JmpCC (Asm.NE, "loop.st.1")); (Asm.Label "loop.br.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 3;
        offset = -12;
        stack slots = {
          i.1   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
        }}}
     ])
