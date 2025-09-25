type typ = KwInt | KwVoid [@@deriving show]
type unop = Complement | Negate [@@deriving show]

type expr = LiteralInt of int | Unary of { unary_operator : unop; exp : expr }
[@@deriving show]

type stmt = Return of expr [@@deriving show]

type func = Function of { return_type : typ; name : string; body : stmt }
[@@deriving show]

type prog = Program of func [@@deriving show]

let mk_prog f = Program f
let mk_func ~return_type ~name ~body = Function { return_type; name; body }
let mk_int_expr n = LiteralInt n
let mk_unop unary_operator exp = Unary { unary_operator; exp }
let mk_return_stmt s = Return s
