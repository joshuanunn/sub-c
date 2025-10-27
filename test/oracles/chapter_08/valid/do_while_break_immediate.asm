(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
       (Asm.Label "start.dowhile.1"); (Asm.Jmp "break.dowhile.1");
       (Asm.Label "continue.dowhile.1");
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.NE, "start.dowhile.1"));
       (Asm.Label "break.dowhile.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
