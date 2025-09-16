type typ = KwInt | KwVoid [@@deriving show]
type expr = LiteralInt of int [@@deriving show]
type stmt = Return of expr [@@deriving show]
type func = { return_type : typ; name : string; body : stmt } [@@deriving show]
type prog = Program of func [@@deriving show]

let mk_prog f = Program f
let mk_func ~return_type ~name ~body = { return_type; name; body }
let mk_int_expr n = LiteralInt n
let mk_return_stmt s = Return s
