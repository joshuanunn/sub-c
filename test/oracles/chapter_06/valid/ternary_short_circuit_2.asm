(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "cond.el.2"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12))); (Asm.Jmp "cond.en.1");
       (Asm.Label "cond.el.2"); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       (Asm.Label "cond.en.1"); (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
