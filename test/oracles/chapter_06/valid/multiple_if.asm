(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "if.el.1"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4))); (Asm.Jmp "if.en.0");
        (Asm.Label "if.el.1"); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
        (Asm.Label "if.en.0"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "if.el.3"));
        (Asm.Mov ((Asm.Imm 4), (Asm.Stack -8))); (Asm.Jmp "if.en.2");
        (Asm.Label "if.el.3"); (Asm.Mov ((Asm.Imm 5), (Asm.Stack -8)));
        (Asm.Label "if.en.2"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        Asm.Binary {op = Asm.Add; src = (Asm.Reg Asm.R10);
          dst = (Asm.Stack -12)};
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 5;
        offset = -12;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          tmp.4 -> -12,
        }}}
     ])
