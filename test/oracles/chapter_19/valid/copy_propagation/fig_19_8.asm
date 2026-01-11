(Asm.Program
   [Asm.Function {name = "callee"; global = true;
      instructions =
      [(Asm.AllocateStack 32); (Asm.Mov ((Asm.Reg Asm.DI), (Asm.Stack -32)));
        (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.SetCC (Asm.E, (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.E, "callee.and.fl.3"));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Data "called_counter")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.SetCC (Asm.E, (Asm.Stack -8)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
        (Asm.JmpCC (Asm.E, "callee.and.fl.3"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -12)));
        (Asm.Jmp "callee.and.en.4"); (Asm.Label "callee.and.fl.3");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.Label "callee.and.en.4");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
        (Asm.JmpCC (Asm.E, "callee.if.en.5"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Data "called_counter")));
        (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "callee.if.en.5");
        (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -32)));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.SetCC (Asm.E, (Asm.Stack -16)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
        (Asm.JmpCC (Asm.E, "callee.and.fl.9"));
        (Asm.Cmp ((Asm.Imm 1), (Asm.Data "called_counter")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.SetCC (Asm.E, (Asm.Stack -20)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
        (Asm.JmpCC (Asm.E, "callee.and.fl.9"));
        (Asm.Mov ((Asm.Imm 1), (Asm.Stack -24)));
        (Asm.Jmp "callee.and.en.10"); (Asm.Label "callee.and.fl.9");
        (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.Label "callee.and.en.10");
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
        (Asm.JmpCC (Asm.E, "callee.if.en.11"));
        (Asm.Mov ((Asm.Imm 2), (Asm.Data "called_counter")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Label "callee.if.en.11");
        (Asm.Mov ((Asm.Imm -1), (Asm.Stack -28)));
        (Asm.Mov ((Asm.Imm -1), (Asm.Data "called_counter")));
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "callee";
        counter = 13;
        offset = -32;
        stack slots = {
          tmp.0  -> -4,
          tmp.1  -> -8,
          tmp.2  -> -12,
          tmp.6  -> -16,
          tmp.7  -> -20,
          tmp.8  -> -24,
          tmp.12 -> -28,
          i.0    -> -32,
        }}};
     Asm.Function {name = "target"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 3), (Asm.Stack -4)));
         (Asm.Label "loop.st.1");
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.DI))); (Asm.Call "callee");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Stack -12), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 4), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.NE, "loop.st.1"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target";
         counter = 1;
         offset = -12;
         stack slots = {
           y.1            -> -4,
           keep_looping.2 -> -8,
           tmp.0          -> -12,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Call "target");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 4), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -12)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2");
         (Asm.Cmp ((Asm.Imm 2), (Asm.Data "called_counter")));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "main.if.en.4"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.4");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 5;
         offset = -16;
         stack slots = {
           result.3 -> -4,
           tmp.0    -> -8,
           tmp.1    -> -12,
           tmp.3    -> -16,
         }}};
     Asm.StaticVariable {name = "called_counter"; global = false; init = 0}])
