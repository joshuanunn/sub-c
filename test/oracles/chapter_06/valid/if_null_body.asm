(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "if_else.1")); (Asm.Jmp "if_end.0");
       (Asm.Label "if_else.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Label "if_end.0"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
