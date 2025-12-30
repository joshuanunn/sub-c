(Asm.Program
   [Asm.Function {name = "target_jz_to_jmp"; global = true;
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        namespace = "target_jz_to_jmp";
        counter = 3;
        offset = -4;
        stack slots = {
          tmp.0 -> -4,
        }}};
     Asm.Function {name = "target_remove_jz"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_remove_jz";
         counter = 3;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_jnz_to_jmp"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_jnz_to_jmp";
         counter = 3;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "target_remove_jnz"; global = true;
       instructions =
       [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "target_remove_jnz";
         counter = 3;
         offset = -4;
         stack slots = {
           tmp.0 -> -4,
         }}};
     Asm.Function {name = "main"; global = true;
       instructions =
       [(Asm.AllocateStack 32); (Asm.Call "target_jz_to_jmp");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -4)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -8)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -8)));
         (Asm.JmpCC (Asm.E, "main.if.en.2"));
         (Asm.Mov ((Asm.Imm 1), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.2"); (Asm.Call "target_remove_jz");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -12)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -12)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -16)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -16)));
         (Asm.JmpCC (Asm.E, "main.if.en.5"));
         (Asm.Mov ((Asm.Imm 2), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.5"); (Asm.Call "target_jnz_to_jmp");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -20)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -20)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -24)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -24)));
         (Asm.JmpCC (Asm.E, "main.if.en.8"));
         (Asm.Mov ((Asm.Imm 3), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.8"); (Asm.Call "target_remove_jnz");
         (Asm.Mov ((Asm.Reg Asm.AX), (Asm.Stack -28)));
         (Asm.Cmp ((Asm.Imm 1), (Asm.Stack -28)));
         (Asm.Mov ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.SetCC (Asm.NE, (Asm.Stack -32)));
         (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -32)));
         (Asm.JmpCC (Asm.E, "main.if.en.11"));
         (Asm.Mov ((Asm.Imm 4), (Asm.Reg Asm.AX))); Asm.Ret;
         (Asm.Label "main.if.en.11");
         (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
       frame =
       Env.lenv {
         namespace = "main";
         counter = 12;
         offset = -32;
         stack slots = {
           tmp.0  -> -4,
           tmp.1  -> -8,
           tmp.3  -> -12,
           tmp.4  -> -16,
           tmp.6  -> -20,
           tmp.7  -> -24,
           tmp.9  -> -28,
           tmp.10 -> -32,
         }}}
     ])
