(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "main.if.el.1"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8))); (Asm.Jmp "main.if.en.0");
        (Asm.Label "main.if.el.1");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        Asm.Unary {op = Asm.BwNot; dst = (Asm.Stack -12)};
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "main.if.en.3"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8))); (Asm.Label "main.if.en.3");
        (Asm.Label "main.if.en.0");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = -12;
        stack slots = {
          a.0   -> -4,
          b.1   -> -8,
          tmp.2 -> -12,
        }}}
     ])
