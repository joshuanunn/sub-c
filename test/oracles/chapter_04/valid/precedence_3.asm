(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.SetCC (Asm.GE, (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Stack -4), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.E, (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX))); Asm.Ret]})
