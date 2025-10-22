(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "if_end.0"));
       (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.E, (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.JmpCC (Asm.E, "if_else.3"));
       (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4))); (Asm.Jmp "if_end.2");
       (Asm.Label "if_else.3"); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
       (Asm.Label "if_end.2"); (Asm.Label "if_end.0");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
