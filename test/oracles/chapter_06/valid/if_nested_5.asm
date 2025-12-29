(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Jmp "main.if.el.1"); (Asm.Jmp "main.if.el.3");
        (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4))); (Asm.Jmp "main.if.en.2");
        (Asm.Label "main.if.el.3"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
        (Asm.Label "main.if.en.2"); (Asm.Jmp "main.if.en.0");
        (Asm.Label "main.if.el.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Label "main.if.en.0");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 4;
        offset = -4;
        stack slots = {
          a.0 -> -4,
        }}}
     ])
