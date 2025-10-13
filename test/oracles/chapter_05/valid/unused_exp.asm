(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 2); dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
