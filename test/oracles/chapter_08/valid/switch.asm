(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.0"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.1"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 3), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.SetCC (Asm.E, (Asm.Stack -12)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.3"));
        (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R11)));
        (Asm.Cmp ((Asm.Imm 5), (Asm.Reg Asm.R11)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.NE, "swit.cs.1.5")); (Asm.Jmp "swit.br.1");
        (Asm.Label "swit.cs.1.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.cs.1.1");
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.cs.1.3"); (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "swit.cs.1.5");
        (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "swit.br.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret];
      frame =
      Env.lenv {
        counter = 4;
        offset = -16;
        stack slots = {
          tmp.0 -> -4,
          tmp.1 -> -8,
          tmp.2 -> -12,
          tmp.3 -> -16,
        }}}
     ])
