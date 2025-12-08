type unary_operator =
  | Negate
  | BwNot
  | Not
  | PreIncrement
  | PreDecrement
  | PostIncrement
  | PostDecrement
[@@deriving show]

type binary_operator =
  | Add
  | Subtract
  | Multiply
  | Divide
  | Remainder
  | BwLeftShift
  | BwRightShift
  | BwAnd
  | BwXor
  | BwOr
  | Equal
  | NotEqual
  | LessOrEqual
  | GreaterOrEqual
  | LessThan
  | GreaterThan
[@@deriving show]

type value = Constant of int | Var of string [@@deriving show]

type instruction =
  | Return of value
  | Unary of { op : unary_operator; src : value; dst : value }
  | Binary of { op : binary_operator; src1 : value; src2 : value; dst : value }
  | Copy of { src : value; dst : value }
  | Jump of { target : string }
  | JumpIfZero of { condition : value; target : string }
  | JumpIfNotZero of { condition : value; target : string }
  | Label of string
  | FunCall of { fun_name : string; args : value list; dst : value }
[@@deriving show]

type func =
  | Function of {
      name : string;
      params : string list;
      body : instruction list;
      frame : Env.lenv;
    }
[@@deriving show]

type prog = Program of func list [@@deriving show]
