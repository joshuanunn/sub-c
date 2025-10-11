(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 12); dst = (Asm.Stack -4)};
       (Asm.Mov ((Asm.Imm 40), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.CX)));
       (Asm.Shl ((Asm.Reg Asm.CL), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Sar ((Asm.Imm 1), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.AX))); Asm.Ret]})
