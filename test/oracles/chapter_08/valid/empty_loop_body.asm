(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 12);
       (Asm.Mov ((Asm.Imm 2147483642), (Asm.Stack -4)));
       (Asm.Label "start.dowhile.1"); (Asm.Label "continue.dowhile.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 5); dst = (Asm.Stack -8)};
       (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 256), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.SetCC (Asm.GE, (Asm.Stack -12)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.JmpCC (Asm.NE, "start.dowhile.1"));
       (Asm.Label "break.dowhile.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
