(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.E, (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.JmpCC (Asm.E, "if_end.1"));
       (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Cdq;
       (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.E, "if_else.4"));
       (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4))); (Asm.Jmp "if_end.3");
       (Asm.Label "if_else.4"); (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.AX)));
       Asm.Cdq; (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4))); (Asm.Label "if_end.3");
       (Asm.Label "if_end.1"); (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
