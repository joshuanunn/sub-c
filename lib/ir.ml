type unary_operator = Negate | BwNot [@@deriving show]

type binary_operator = Add | Subtract | Multiply | Divide | Remainder
[@@deriving show]

type value = Constant of int | Var of string [@@deriving show]

type instruction =
  | Return of value
  | Unary of { op : unary_operator; src : value; dst : value }
  | Binary of { op : binary_operator; src1 : value; src2 : value; dst : value }
[@@deriving show]

type func = Function of { name : string; body : instruction list }
[@@deriving show]

type prog = Program of func [@@deriving show]
