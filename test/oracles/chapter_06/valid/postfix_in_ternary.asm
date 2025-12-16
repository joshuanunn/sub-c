(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 10); dst = (Asm.Stack -12)};
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "cond.el.3"));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "cond.en.2");
        (Asm.Label "cond.el.3");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
        Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -4)};
        (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        (Asm.Label "cond.en.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 5;
        offset = -16;
        stack slots = {
          x.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          tmp.4 -> -16,
        }}}
     ])
