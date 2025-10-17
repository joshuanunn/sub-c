(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 40); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -24)};
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.E, (Asm.Stack -16)));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
       (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.SetCC (Asm.E, (Asm.Stack -28)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.JmpCC (Asm.E, "and_false.7"));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
       (Asm.SetCC (Asm.E, (Asm.Stack -36)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
       (Asm.JmpCC (Asm.E, "and_false.7"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -40))); (Asm.Jmp "and_end.8");
       (Asm.Label "and_false.7"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
       (Asm.Label "and_end.8");
       (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
