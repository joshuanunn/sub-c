(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 20); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R11)));
       Asm.Binary {bop = Asm.Mult; src2 = (Asm.Imm 2);
         dst = (Asm.Reg Asm.R11)};
       (Asm.Mov ((Asm.Reg Asm.R11), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 4), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.CX)));
       (Asm.Shl ((Asm.Reg Asm.CL), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Imm 2); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Imm 100), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.CX)));
       (Asm.Sar ((Asm.Reg Asm.CL), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -20)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       Asm.Binary {bop = Asm.Add; src2 = (Asm.Reg Asm.R10);
         dst = (Asm.Stack -20)};
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.AX))); Asm.Ret]})
