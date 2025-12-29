(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8))); (Asm.Jmp "main.cond.en.1");
        (Asm.Label "main.cond.el.2");
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -8)));
        (Asm.Label "main.cond.en.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R11)));
        Asm.Binary {op = Asm.Mult; src = (Asm.Stack -8);
          dst = (Asm.Reg Asm.R11)};
        (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = -12;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.3 -> -12,
        }}}
     ])
