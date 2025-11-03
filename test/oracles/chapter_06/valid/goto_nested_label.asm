(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Jmp "labelB.1"); (Asm.Label "labelA.0"); (Asm.Label "labelB.1");
       (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
