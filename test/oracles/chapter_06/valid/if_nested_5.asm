(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "if_else.2"));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "if_else.4"));
       (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4))); (Asm.Jmp "if_end.3");
       (Asm.Label "if_else.4"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
       (Asm.Label "if_end.3"); (Asm.Jmp "if_end.1"); (Asm.Label "if_else.2");
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Label "if_end.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
