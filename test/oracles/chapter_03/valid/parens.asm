(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 4); dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R11)));
       Asm.Binary {op = Asm.Mult; src = (Asm.Stack -4);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret]})
