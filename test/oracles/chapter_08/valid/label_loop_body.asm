(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.Jmp "label"); (Asm.Label "continue.while.1");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.JmpCC (Asm.E, "break.while.1")); (Asm.Label "label");
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4))); (Asm.Jmp "continue.while.1");
       (Asm.Label "break.while.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
