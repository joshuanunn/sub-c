(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8);
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and_false.0"));
       Asm.Mov {src = (Asm.Imm 2); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and_false.0"));
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Jmp "and_end.1"); (Asm.Label "and_false.0");
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.Label "and_end.1"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "or_true.2"));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -8)};
       (Asm.Jmp "or_end.3"); (Asm.Label "or_true.2");
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Stack -8)};
       (Asm.Label "or_end.3");
       Asm.Mov {src = (Asm.Stack -8); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
