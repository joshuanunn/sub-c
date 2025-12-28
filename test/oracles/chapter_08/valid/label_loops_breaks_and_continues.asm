(Asm.Program
   [Asm.Function {name = "main"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Jmp "do_label.0"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "do_label.0"); (Asm.Label "loop.st.1");
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Jmp "while_label.1");
        (Asm.Label "loop.ct.1"); (Asm.Jmp "loop.st.1");
        (Asm.Label "loop.br.1"); (Asm.Label "while_label.1");
        (Asm.Label "loop.ct.2");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
        (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Jmp "break_label.2"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "break_label.2"); (Asm.Jmp "loop.br.2");
        (Asm.Jmp "loop.ct.2"); (Asm.Label "loop.br.2");
        (Asm.Jmp "for_label.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
        Asm.Ret; (Asm.Label "for_label.3");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12))); (Asm.Label "loop.st.3");
        (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -12)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.L, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "loop.br.3"));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -20)};
        (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
        (Asm.Jmp "continue_label.4");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "continue_label.4"); (Asm.Jmp "loop.ct.3");
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "loop.ct.3");
        (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
        Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -24)};
        (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
        (Asm.Jmp "loop.st.3"); (Asm.Label "loop.br.3");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 4;
        offset = -24;
        stack slots = {
          sum.5 -> -4,
          tmp.0 -> -8,
          i.6   -> -12,
          tmp.1 -> -16,
          tmp.2 -> -20,
          tmp.3 -> -24,
        }}}
     ])
