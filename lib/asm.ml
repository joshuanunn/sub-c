type reg = AX | CX | DX | DI | SI | R8 | R9 | R10 | R11 [@@deriving show]
type cond_code = E | NE | G | GE | L | LE [@@deriving show]

type operand =
  | Imm of int
  | Reg of reg
  | Pseudo of string
  | Stack of int
  | Data of string
[@@deriving show]

type unary_operator = BwNot | Neg [@@deriving show]

type binary_operator = Add | Sub | Mult | BwAnd | BwXor | BwOr
[@@deriving show]

type instruction =
  | Mov of operand * operand
  | Unary of { op : unary_operator; dst : operand }
  | Binary of { op : binary_operator; src : operand; dst : operand }
  | Cmp of operand * operand
  | Idiv of operand
  | Cdq
  | Shl of operand * operand
  | Sar of operand * operand
  | Jmp of string
  | JmpCC of cond_code * string
  | SetCC of cond_code * operand
  | Label of string
  | AllocateStack of int
  | DeallocateStack of int
  | Push of operand
  | Call of string
  | Ret
[@@deriving show]

type top_level =
  | Function of {
      name : string;
      global : bool;
      instructions : instruction list;
      frame : Env.lenv;
    }
  | StaticVariable of { name : string; global : bool; init : int }
[@@deriving show]

type prog = Program of top_level list [@@deriving show]
