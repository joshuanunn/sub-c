(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "cond_e2.3"));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Cdq;
       (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
       (Asm.Idiv (Asm.Reg Asm.R10));
       (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4))); (Asm.Jmp "cond_end.2");
       (Asm.Label "cond_e2.3"); (Asm.Label "cond_end.2");
       (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.E, (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
