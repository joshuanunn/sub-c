(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX)));
       Asm.Cdq; (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret]})
