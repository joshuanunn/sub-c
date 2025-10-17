(Asm.Program
   Asm.Function {name = "main";
     instructions =
     [(Asm.AllocateStack 60); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
       (Asm.Mov ((Asm.Stack -40), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -40)};
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -40)};
       Asm.Binary {op = Asm.Add; src = (Asm.Imm 1); dst = (Asm.Stack -40)};
       (Asm.Mov ((Asm.Stack -48), (Asm.Reg Asm.R10)));
       (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -32)));
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -48)};
       Asm.Binary {op = Asm.Sub; src = (Asm.Imm 1); dst = (Asm.Stack -48)};
       (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -40)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
       (Asm.SetCC (Asm.E, (Asm.Stack -44)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
       (Asm.JmpCC (Asm.E, "and_false.8"));
       (Asm.Mov ((Asm.Imm 2), (Asm.Stack -52)));
       Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -52)};
       (Asm.Mov ((Asm.Stack -52), (Asm.Reg Asm.R10)));
       (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -48)));
       (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
       (Asm.SetCC (Asm.E, (Asm.Stack -56)));
       (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
       (Asm.JmpCC (Asm.E, "and_false.8"));
       (Asm.Mov ((Asm.Imm 1), (Asm.Stack -60))); (Asm.Jmp "and_end.9");
       (Asm.Label "and_false.8"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -60)));
       (Asm.Label "and_end.9");
       (Asm.Mov ((Asm.Stack -60), (Asm.Reg Asm.AX))); Asm.Ret;
       (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret]})
