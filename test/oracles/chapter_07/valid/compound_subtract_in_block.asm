(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 24); (Asm.Mov ((Asm.Imm 5), (Asm.Stack -4)));
       (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.SetCC (Asm.G, (Asm.Stack -8)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
       (Asm.JmpCC (Asm.E, "if_end.1"));
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -12)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 4); dst = (Asm.Stack -12)};
       (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
       (Asm.Mov ((Asm.Imm 5), (Asm.Stack -16)));
       (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -16)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.SetCC (Asm.G, (Asm.Stack -20)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
       (Asm.JmpCC (Asm.E, "if_end.4"));
       (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -24)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 4); dst = (Asm.Stack -24)};
       (Asm.Mov ((Asm.Stack -24), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       (Asm.Label "if_end.4"); (Asm.Label "if_end.1");
       (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
