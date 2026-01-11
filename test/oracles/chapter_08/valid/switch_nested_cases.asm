(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 64); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.NE, "swit.cs.2.0"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -32))); (Asm.Jmp "swit.cs.2.4");
        (Asm.Label "swit.cs.2.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.cs.2.4");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36)));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "main.and.fl.12"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -52))); (Asm.Jmp "main.and.en.13");
        (Asm.Label "main.and.fl.12");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.Label "main.and.en.13");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
        (Asm.JmpCC (Asm.E, "main.and.fl.15"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "main.and.fl.15"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -56))); (Asm.Jmp "main.and.en.16");
        (Asm.Label "main.and.fl.15");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
        (Asm.Label "main.and.en.16");
        (Asm.Mov ((Asm.Stack -56), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "main";
        counter = 17;
        offset = -56;
        stack slots = {
          switch1.0 -> -4,
          switch2.1 -> -8,
          switch3.2 -> -12,
          tmp.0     -> -16,
          tmp.1     -> -20,
          tmp.2     -> -24,
          tmp.4     -> -28,
          tmp.5     -> -32,
          tmp.8     -> -36,
          i.3       -> -40,
          tmp.9     -> -44,
          tmp.10    -> -48,
          tmp.11    -> -52,
          tmp.14    -> -56,
        }}}
     ])
