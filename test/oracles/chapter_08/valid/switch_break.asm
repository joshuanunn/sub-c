(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 5), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.5"));
        (Asm.Cmp ((Asm.Imm 6), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.6")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.5"); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Jmp "swit.br.1"); (Asm.Label "swit.cs.1.6");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4))); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.br.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 2;
        offset = -12;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
        }}}
     ])
