type reg = AX | R10 [@@deriving show]

type operand = Imm of int | Reg of reg | Pseudo of string | Stack of int
[@@deriving show]

type unary_operator = Neg | Not [@@deriving show]

type instruction =
  | Mov of { src : operand; dst : operand }
  | Unary of { uop : unary_operator; dst : operand }
  | AllocateStack of int
  | Ret
[@@deriving show]

type func = Function of { name : string; instructions : instruction list }
[@@deriving show]

type prog = Program of func [@@deriving show]
