(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.Jmp "labelB"); (Asm.Label "labelA"); (Asm.Label "labelB");
       (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
