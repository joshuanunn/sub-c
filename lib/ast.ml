type typ = KwInt | KwVoid [@@deriving show]
type unop = Complement | Negate [@@deriving show]
type binop = Add | Subtract | Multiply | Divide | Remainder [@@deriving show]

type expr =
  | LiteralInt of int
  | Unary of { op : unop; exp : expr }
  | Binary of { op : binop; left : expr; right : expr }
[@@deriving show]

type stmt = Return of expr [@@deriving show]

type func = Function of { return_type : typ; name : string; body : stmt }
[@@deriving show]

type prog = Program of func [@@deriving show]

let mk_prog f = Program f
let mk_func ~return_type ~name ~body = Function { return_type; name; body }
let mk_int_expr n = LiteralInt n
let mk_binop_expr op left right = Binary { op; left; right }
let mk_unop_expr op exp = Unary { op; exp }
let mk_return_stmt s = Return s
