(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Label "unused"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
