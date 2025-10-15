(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 40); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 3); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
       (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -24)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.SetCC (Asm.E, (Asm.Stack -28)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
       (Asm.JmpCC (Asm.E, "and_false.6"));
       (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -32)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
       (Asm.SetCC (Asm.E, (Asm.Stack -36)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
       (Asm.JmpCC (Asm.E, "and_false.6"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -40))); (Asm.Jmp "and_end.7");
       (Asm.Label "and_false.6"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
       (Asm.Label "and_end.7");
       (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
