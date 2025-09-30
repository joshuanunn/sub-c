type reg = AX | DX | R10 | R11 [@@deriving show]

type operand = Imm of int | Reg of reg | Pseudo of string | Stack of int
[@@deriving show]

type unary_operator = Neg | Not [@@deriving show]
type binary_operator = Add | Sub | Mult [@@deriving show]

type instruction =
  | Mov of { src : operand; dst : operand }
  | Unary of { uop : unary_operator; dst : operand }
  | Binary of { bop : binary_operator; src2 : operand; dst : operand }
  | Idiv of operand
  | Cdq
  | AllocateStack of int
  | Ret
[@@deriving show]

type func = Function of { name : string; instructions : instruction list }
[@@deriving show]

type prog = Program of func [@@deriving show]
