(Asm.Program
   [Asm.Function {name = "target_add"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 300), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target_add";
        counter = 1;
        offset = -4;
        stack slots = {
          tmp.0 -> -4,
        }}};
     Asm.Function {name = "target_sub"; global = true;
       instructions =
       [(Asm.AllocateStack 16);
         (Asm.Mov ((Asm.Imm -2147483645), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_sub";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_mult"; global = true;
       instructions =
       [(Asm.AllocateStack 16);
         (Asm.Mov ((Asm.Imm 1000000), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_mult";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_div"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 277), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_div";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_rem"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_rem";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_eq_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_eq_true";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_eq_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_eq_false";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_neq_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_neq_true";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_neq_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_neq_false";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_gt_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_gt_true";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_gt_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_gt_false";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_ge_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_ge_true";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_ge_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_ge_false";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_lt_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_lt_true";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_lt_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_lt_false";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_le_true"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_le_true";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_le_false"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_le_false";
         counter = 1;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 128); (Asm.Call "target_add");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 300), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2"); (Asm.Call "target_sub");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Data "val_to_negate"), (Asm.Reg Asm.R10)));
         (Asm.Mov ((Asm.Reg Asm.R10), (Asm.Stack -16)));
         Asm.Unary {op = Asm.Neg; dst = (Asm.Stack -16)};
         (Asm.Mov ((Asm.Stack -16), (Asm.Reg Asm.R10)));
         (Asm.Cmp ((Asm.Reg Asm.R10), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -20)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -20)));
         (Asm.JmpCC (Asm.E, "main.if.en.6"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.6"); (Asm.Call "target_mult");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 1000000), (Asm.Stack -24)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -28)));
         (Asm.JmpCC (Asm.E, "main.if.en.9"));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.9"); (Asm.Call "target_div");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 277), (Asm.Stack -32)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -36)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -36)));
         (Asm.JmpCC (Asm.E, "main.if.en.12"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.12"); (Asm.Call "target_rem");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -40)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -40)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -44)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -44)));
         (Asm.JmpCC (Asm.E, "main.if.en.15"));
         (Asm.Mov ((Asm.Imm 5), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.15"); (Asm.Call "target_eq_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -48)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -48)));
         (Asm.JmpCC (Asm.E, "main.if.en.17"));
         (Asm.Mov ((Asm.Imm 6), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.17"); (Asm.Call "target_eq_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -52)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -52)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.SetCC (Asm.E, (Asm.Stack -56)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -56)));
         (Asm.JmpCC (Asm.E, "main.if.en.20"));
         (Asm.Mov ((Asm.Imm 7), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.20"); (Asm.Call "target_neq_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -60)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -60)));
         (Asm.JmpCC (Asm.E, "main.if.en.22"));
         (Asm.Mov ((Asm.Imm 8), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.22"); (Asm.Call "target_neq_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -64)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -64)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.SetCC (Asm.E, (Asm.Stack -68)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -68)));
         (Asm.JmpCC (Asm.E, "main.if.en.25"));
         (Asm.Mov ((Asm.Imm 9), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.25"); (Asm.Call "target_gt_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -72)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -72)));
         (Asm.JmpCC (Asm.E, "main.if.en.27"));
         (Asm.Mov ((Asm.Imm 10), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.27"); (Asm.Call "target_gt_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -76)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -76)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.SetCC (Asm.E, (Asm.Stack -80)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -80)));
         (Asm.JmpCC (Asm.E, "main.if.en.30"));
         (Asm.Mov ((Asm.Imm 11), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.30"); (Asm.Call "target_ge_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -84)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -84)));
         (Asm.JmpCC (Asm.E, "main.if.en.32"));
         (Asm.Mov ((Asm.Imm 12), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.32"); (Asm.Call "target_ge_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -88)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -88)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.SetCC (Asm.E, (Asm.Stack -92)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -92)));
         (Asm.JmpCC (Asm.E, "main.if.en.35"));
         (Asm.Mov ((Asm.Imm 13), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.35"); (Asm.Call "target_lt_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -96)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -96)));
         (Asm.JmpCC (Asm.E, "main.if.en.37"));
         (Asm.Mov ((Asm.Imm 14), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.37"); (Asm.Call "target_lt_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -100)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -100)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -104)));
         (Asm.SetCC (Asm.E, (Asm.Stack -104)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -104)));
         (Asm.JmpCC (Asm.E, "main.if.en.40"));
         (Asm.Mov ((Asm.Imm 15), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.40"); (Asm.Call "target_le_false");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -108)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -108)));
         (Asm.JmpCC (Asm.E, "main.if.en.42"));
         (Asm.Mov ((Asm.Imm 16), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.42"); (Asm.Call "target_le_true");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -112)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -112)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -116)));
         (Asm.SetCC (Asm.E, (Asm.Stack -116)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -116)));
         (Asm.JmpCC (Asm.E, "main.if.en.45"));
         (Asm.Mov ((Asm.Imm 17), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.45");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 46;
         offset = -116;
         stack slots = {
           tmp.0  -> -4,
           tmp.1  -> -8,
           tmp.3  -> -12,
           tmp.4  -> -16,
           tmp.5  -> -20,
           tmp.7  -> -24,
           tmp.8  -> -28,
           tmp.10 -> -32,
           tmp.11 -> -36,
           tmp.13 -> -40,
           tmp.14 -> -44,
           tmp.16 -> -48,
           tmp.18 -> -52,
           tmp.19 -> -56,
           tmp.21 -> -60,
           tmp.23 -> -64,
           tmp.24 -> -68,
           tmp.26 -> -72,
           tmp.28 -> -76,
           tmp.29 -> -80,
           tmp.31 -> -84,
           tmp.33 -> -88,
           tmp.34 -> -92,
           tmp.36 -> -96,
           tmp.38 -> -100,
           tmp.39 -> -104,
           tmp.41 -> -108,
           tmp.43 -> -112,
           tmp.44 -> -116,
         }}};
     Asm.StaticVariable {name = "val_to_negate"; global = true;
       init = 2147483645}
     ])
