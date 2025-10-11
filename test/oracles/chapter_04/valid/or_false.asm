(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4);
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.0"));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Reg Asm.R11)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.0"));
       Asm.Mov {src = (Asm.Imm 0); dst = (Asm.Stack -4)};
       (Asm.Jmp "or_end.1"); (Asm.Label "or_true.0");
       Asm.Mov {src = (Asm.Imm 1); dst = (Asm.Stack -4)};
       (Asm.Label "or_end.1");
       Asm.Mov {src = (Asm.Stack -4); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
