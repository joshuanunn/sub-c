type value = Constant of int [@@deriving show]
type instruction = Return of value [@@deriving show]

type func = Function of { name : string; body : instruction list }
[@@deriving show]

type prog = Program of func [@@deriving show]
