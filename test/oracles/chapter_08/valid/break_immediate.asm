(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 4); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
       (Asm.Label "loop.ct.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "loop.br.1")); (Asm.Jmp "loop.br.1");
       (Asm.Jmp "loop.ct.1"); (Asm.Label "loop.br.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
