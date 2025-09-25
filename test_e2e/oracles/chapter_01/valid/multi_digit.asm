(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [Asm.Mov {src = (Asm.Imm 100); dst = (Asm.Reg Asm.AX)}; Asm.Ret]})
