(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 24); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.SetCC (Asm.E, (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
       (Asm.JmpCC (Asm.E, "and_false.5"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -8)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -8)};
       (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -8)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
       (Asm.SetCC (Asm.G, (Asm.Stack -12)));
       (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.R11)));
       (Asm.Cmp ((Asm.Stack -12), (Asm.Reg Asm.R11)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.SetCC (Asm.E, (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
       (Asm.JmpCC (Asm.E, "and_false.5"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20))); (Asm.Jmp "and_end.6");
       (Asm.Label "and_false.5"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.Label "and_end.6");
       (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -24)};
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.AX))); Asm.Ret]})
