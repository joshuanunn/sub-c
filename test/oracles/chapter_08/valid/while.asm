(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Label "continue.while.1");
       (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.L, (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.JmpCC (Asm.E, "break.while.1"));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 2); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Jmp "continue.while.1"); (Asm.Label "break.while.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
