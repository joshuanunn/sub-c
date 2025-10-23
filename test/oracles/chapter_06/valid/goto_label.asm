(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Jmp "label"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Label "label"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
