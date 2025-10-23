(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 5), (Asm.Stack -4)));
       (Asm.Jmp "inner"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Label "inner"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
