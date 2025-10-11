(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R11)));
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Imm 3);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret]})
