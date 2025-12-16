(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "if.el.2"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Jmp "if.en.1"); (Asm.Label "if.el.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "if.en.4"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "if.en.4"); (Asm.Label "if.en.1");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 5;
        offset = -12;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.3 -> -12,
        }}}
     ])
