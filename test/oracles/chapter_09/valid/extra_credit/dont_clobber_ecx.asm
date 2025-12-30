(Asm.Program
   [Asm.Function {name = "x"; global = true;
      instructions =
      [(Asm.AllocateStack 80); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Reg Asm.SI), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Reg Asm.DX), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Reg Asm.CX), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Reg Asm.R8), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Reg Asm.R9), (Asm.Stack -68)));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -48)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "x.and.fl.3"));
        (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -52)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "x.and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12))); (Asm.Jmp "x.and.en.4");
        (Asm.Label "x.and.fl.3"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Label "x.and.en.4"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "x.and.fl.7"));
        (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -56)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "x.and.fl.7"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -20))); (Asm.Jmp "x.and.en.8");
        (Asm.Label "x.and.fl.7"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.Label "x.and.en.8"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "x.and.fl.11"));
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -60)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.SetCC (Asm.E, (Asm.Stack -24)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "x.and.fl.11"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -28))); (Asm.Jmp "x.and.en.12");
        (Asm.Label "x.and.fl.11"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.Label "x.and.en.12"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
        (Asm.JmpCC (Asm.E, "x.and.fl.15"));
        (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -64)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.SetCC (Asm.E, (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
        (Asm.JmpCC (Asm.E, "x.and.fl.15"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -36))); (Asm.Jmp "x.and.en.16");
        (Asm.Label "x.and.fl.15"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.Label "x.and.en.16"); (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
        (Asm.JmpCC (Asm.E, "x.and.fl.19"));
        (Asm.Cmp ((Asm.Imm 6), (Asm.Stack -68)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.SetCC (Asm.E, (Asm.Stack -40)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
        (Asm.JmpCC (Asm.E, "x.and.fl.19"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -44))); (Asm.Jmp "x.and.en.20");
        (Asm.Label "x.and.fl.19"); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
        (Asm.Label "x.and.en.20");
        (Asm.Mov ((Asm.Stack -44), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "x";
        counter = 21;
        offset = -68;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.5  -> -16,
          tmp.6  -> -20,
          tmp.9  -> -24,
          tmp.10 -> -28,
          tmp.13 -> -32,
          tmp.14 -> -36,
          tmp.17 -> -40,
          tmp.18 -> -44,
          a.0    -> -48,
          b.1    -> -52,
          c.2    -> -56,
          d.3    -> -60,
          e.4    -> -64,
          f.5    -> -68,
        }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Cdq;
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.R10)));
         (Asm.Idiv (Asm.Reg Asm.R10));
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 24), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.CX)));
         (Asm.Sar ((Asm.Reg Asm.CX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.DI)));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.SI)));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.DX)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.CX)));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.R8)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R9))); (Asm.Call "x");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 3;
         offset = -16;
         stack slots = {
           a.6   -> -4,
           tmp.0 -> -8,
           tmp.1 -> -12,
           tmp.2 -> -16,
         }}}
     ])
