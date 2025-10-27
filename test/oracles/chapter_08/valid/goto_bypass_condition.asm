(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Label "start.dowhile.1"); (Asm.Label "while_start");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.SetCC (Asm.L, (Asm.Stack -12)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.E, "if_end.2")); (Asm.Jmp "while_start");
       (Asm.Label "if_end.2"); (Asm.Label "continue.dowhile.1");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.NE, "start.dowhile.1"));
       (Asm.Label "break.dowhile.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
