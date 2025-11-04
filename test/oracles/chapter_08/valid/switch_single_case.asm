(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 8); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.E, (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.JmpCC (Asm.NE, "swit.cs.1.1")); (Asm.Jmp "swit.br.1");
       (Asm.Label "swit.cs.1.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX)));
       Asm.Ret; (Asm.Label "swit.br.1");
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
