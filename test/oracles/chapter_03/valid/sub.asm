(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 2); dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret]})
