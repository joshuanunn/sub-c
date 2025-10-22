(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Jmp "labelB.0"); (Asm.Label "labelA.1"); (Asm.Label "labelB.0");
       (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
