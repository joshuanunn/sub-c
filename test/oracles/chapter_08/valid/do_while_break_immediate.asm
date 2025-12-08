(Asm.Program
   [Asm.Function {name = "main";
      instructions =
      [(Asm.AllocateStack 16); (Asm.Mov ((Asm.Imm 10), (Asm.Stack -4)));
        (Asm.Label "loop.st.1"); (Asm.Jmp "loop.br.1");
        (Asm.Label "loop.ct.1"); (Asm.Mov ((Asm.Imm 1), (Asm.Stack -4)));
        (Asm.Cmp ((Asm.Imm 0), (Asm.Stack -4)));
        (Asm.JmpCC (Asm.NE, "loop.st.1")); (Asm.Label "loop.br.1");
        (Asm.Mov ((Asm.Stack -4), (Asm.Reg Asm.AX))); Asm.Ret;
        (Asm.Mov ((Asm.Imm 0), (Asm.Reg Asm.AX))); Asm.Ret];
      frame =
      Env.lenv {
        counter = 0;
        offset = -4;
        stack slots = {
          a.0 -> -4,
        }}}
     ])
