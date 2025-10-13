(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "or_true.4"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and_false.1"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "and_false.1"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Jmp "and_end.2");
       (Asm.Label "and_false.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Label "and_end.2"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "or_true.4"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8))); (Asm.Jmp "or_end.5");
       (Asm.Label "or_true.4"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Label "or_end.5"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX)));
       Asm.Ret]})
