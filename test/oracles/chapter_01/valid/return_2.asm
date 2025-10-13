(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
