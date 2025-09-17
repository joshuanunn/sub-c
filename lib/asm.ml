type operand = Imm of int | Register of string [@@deriving show]

type instruction = Mov of { src : operand; dst : operand } | Ret
[@@deriving show]

type func = Function of { name : string; instructions : instruction list }
[@@deriving show]

type prog = Program of func [@@deriving show]
