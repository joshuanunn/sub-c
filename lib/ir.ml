type unary_operator = Complement | Negate [@@deriving show]
type value = Constant of int | Var of string [@@deriving show]

type instruction =
  | Return of value
  | Unary of { op : unary_operator; src : value; dst : value }
[@@deriving show]

type func = Function of { name : string; body : instruction list }
[@@deriving show]

type prog = Program of func [@@deriving show]
