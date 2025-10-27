(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 24); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.G, (Asm.Stack -20)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.JmpCC (Asm.E, "cond.el.3"));
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -16))); (Asm.Jmp "cond.en.2");
       (Asm.Label "cond.el.3"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.E, "cond.el.6"));
       (Asm.Mov ((Asm.Imm 6), (Asm.Stack -24))); (Asm.Jmp "cond.en.5");
       (Asm.Label "cond.el.6"); (Asm.Mov ((Asm.Imm 7), (Asm.Stack -24)));
       (Asm.Label "cond.en.5");
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       (Asm.Label "cond.en.2");
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
