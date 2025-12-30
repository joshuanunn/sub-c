(Asm.Program
   [Asm.Function {name = "target_if"; global = true;
      instructions = [(Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target_if";
        counter = 1;
        offset = 0;
        stack slots = {
        }}};
     Asm.Function {name = "target_if_else_true"; global = true;
       instructions = [(Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_if_else_true";
         counter = 2;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_if_else_false"; global = true;
       instructions = [(Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_if_else_false";
         counter = 2;
         offset = 0;
         stack slots = {
         }}};
     Asm.Function {name = "target_conditional_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 2), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_conditional_true";
         counter = 3;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_conditional_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 5), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_conditional_false";
         counter = 3;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_do_loop"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_do_loop";
         counter = 0;
         offset = -4;
         stack slots = {
           retval.0 -> -4,
         }}};
     Asm.Function {name = "target_while_loop_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_while_loop_false";
         counter = 0;
         offset = -4;
         stack slots = {
           retval.1 -> -4,
         }}};
     Asm.Function {name = "target_while_loop_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_while_loop_true";
         counter = 0;
         offset = -4;
         stack slots = {
           retval.2 -> -4,
         }}};
     Asm.Function {name = "target_for_loop_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -8), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_for_loop_true";
         counter = 0;
         offset = -8;
         stack slots = {
           retval.3 -> -4,
           i.4      -> -8,
         }}};
     Asm.Function {name = "target_for_loop_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 100), (Asm.Stack -8)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_for_loop_false";
         counter = 0;
         offset = -8;
         stack slots = {
           retval.5 -> -4,
           i.6      -> -8,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 80); (Asm.Call "target_if");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2"); (Asm.Call "target_if_else_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "main.if.en.5"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.5"); (Asm.Call "target_if_else_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
         (Asm.Cmp ((Asm.Imm 3), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.JmpCC (Asm.E, "main.if.en.8"));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.8"); (Asm.Call "target_conditional_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 2), (Asm.Stack -28)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.11"); (Asm.Call "target_conditional_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 5), (Asm.Stack -36)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -40)));
         (Asm.JmpCC (Asm.E, "main.if.en.14"));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.14"); (Asm.Call "target_do_loop");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -44)));
         (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -44)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.JmpCC (Asm.E, "main.if.en.17"));
         (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.17"); (Asm.Call "target_while_loop_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -52)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -56)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.JmpCC (Asm.E, "main.if.en.20"));
         (Asm.Mov ((Asm.Imm 7), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.20"); (Asm.Call "target_while_loop_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -60)));
         (Asm.Cmp ((Asm.Imm 10), (Asm.Stack -60)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -64)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.JmpCC (Asm.E, "main.if.en.23"));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.23"); (Asm.Call "target_for_loop_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -68)));
         (Asm.Cmp ((Asm.Imm 100), (Asm.Stack -68)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -72)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.JmpCC (Asm.E, "main.if.en.26"));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.26"); (Asm.Call "target_for_loop_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -76)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -80)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.JmpCC (Asm.E, "main.if.en.29"));
         (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.29");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 30;
         offset = -80;
         stack slots = {
           tmp.0  -> -4,
           tmp.1  -> -8,
           tmp.3  -> -12,
           tmp.4  -> -16,
           tmp.6  -> -20,
           tmp.7  -> -24,
           tmp.9  -> -28,
           tmp.10 -> -32,
           tmp.12 -> -36,
           tmp.13 -> -40,
           tmp.15 -> -44,
           tmp.16 -> -48,
           tmp.18 -> -52,
           tmp.19 -> -56,
           tmp.21 -> -60,
           tmp.22 -> -64,
           tmp.24 -> -68,
           tmp.25 -> -72,
           tmp.27 -> -76,
           tmp.28 -> -80,
         }}}
     ])
