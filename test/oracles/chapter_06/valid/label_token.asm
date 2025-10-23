(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Jmp "_foo_1_"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Label "_foo_1_");
       (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
