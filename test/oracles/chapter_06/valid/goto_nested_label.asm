(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Jmp "main.labelB.0"); (Asm.Label "main.labelA.1");
       (Asm.Label "main.labelB.0");
       (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
