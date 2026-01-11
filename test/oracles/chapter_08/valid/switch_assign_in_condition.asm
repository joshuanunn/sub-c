(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.0"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12))); (Asm.Jmp "swit.cs.1.1");
        (Asm.Label "swit.cs.1.0");
        (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.cs.1.1"); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 3;
        offset = -16;
        stack slots = {
          a.0   -> -4,
          tmp.0 -> -8,
          tmp.1 -> -12,
          tmp.2 -> -16,
        }}}
     ])
