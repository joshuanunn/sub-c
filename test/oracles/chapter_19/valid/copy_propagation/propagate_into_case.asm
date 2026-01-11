(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.R10)));
        (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "globvar")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 0;
        offset = -4;
        stack slots = {
          arg.0 -> -4,
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 32);
         (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.NE, "swit.cs.1.1"));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.E, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.NE, "swit.cs.1.2")); (Asm.Jmp "swit.df.1");
         (Asm.Label "swit.cs.1.1"); (Asm.Mov ((Asm.Imm 20), (Asm.Stack -4)));
         (Asm.Jmp "swit.br.1"); (Asm.Label "swit.cs.1.2");
         (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.DI))); (Asm.Call "callee");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -16)));
         (Asm.Jmp "swit.br.1"); (Asm.Label "swit.df.1");
         (Asm.Mov ((Asm.Imm -1), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Stack -20), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Data "globvar")));
         (Asm.Label "swit.br.1"); (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX)));
         Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 4;
         offset = -24;
         stack slots = {
           arg.2  -> -4,
           tmp.0  -> -8,
           tmp.1  -> -12,
           tmp.2  -> -16,
           tmp.3  -> -20,
           flag.1 -> -24,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.DI)));
         (Asm.Call "target"); (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 10), (Asm.Data "globvar")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.E, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2");
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 3;
         offset = -8;
         stack slots = {
           tmp.0 -> -4,
           tmp.1 -> -8,
         }}};
     Asm.StaticVariable {name = "globvar"; global = true; init = 0}])
