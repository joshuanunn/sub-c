(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Jmp "main.cond.el.2");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Jmp "main.cond.en.1");
        (Asm.Label "main.cond.el.2"); (Asm.Jmp "main.or.tr.4");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "main.or.en.5");
        (Asm.Label "main.or.tr.4"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Label "main.or.en.5");
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Label "main.cond.en.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 6;
        offset = -8;
        stack slots = {
          tmp.0 -> -4,
          tmp.3 -> -8,
        }}}
     ])
