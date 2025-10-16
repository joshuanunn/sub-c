type typ = KwInt | KwVoid [@@deriving show]
type ident = Identifier of string [@@deriving show]

type unop =
  | Negate
  | Not
  | BwNot
  | PreIncrement
  | PreDecrement
  | PostIncrement
  | PostDecrement
[@@deriving show]

type binop =
  | Add
  | Subtract
  | Multiply
  | Divide
  | Remainder
  | And
  | Or
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

type expr =
  | LiteralInt of int
  | Var of ident
  | Unary of { op : unop; exp : expr }
  | Binary of { op : binop; left : expr; right : expr }
  | Assignment of expr * expr
[@@deriving show]

type stmt = Return of expr | Expression of expr | Null [@@deriving show]
type decl = Declaration of ident * expr option [@@deriving show]
type block_item = S of stmt | D of decl [@@deriving show]
type block = block_item list [@@deriving show]

type func = Function of { return_type : typ; name : ident; body : block }
[@@deriving show]

type prog = Program of func [@@deriving show]

let mk_prog f = Program f
let mk_func ~return_type ~name ~body = Function { return_type; name; body }
let mk_ident i = Identifier i
let mk_int_expr n = LiteralInt n
let mk_binop_expr op left right = Binary { op; left; right }
let mk_unop_expr op exp = Unary { op; exp }
let mk_assign_expr left right = Assignment (Var left, right)
let mk_return_stmt s = Return s
let mk_expr_stmt s = Expression s
let mk_decl_init_stmt i v = Declaration (i, Some v)
let mk_decl_stmt i = Declaration (i, None)
let mk_block_stmt s = S s
let mk_block_decl d = D d

(** [mk_comp_assign_expr op left right] resolves compound ops by evaluating the
    binary expression [left] [op] [right], then assigning result to [left] *)
let mk_comp_assign_expr op left right =
  let var = Var left in
  let result = mk_binop_expr op var right in
  Assignment (var, result)

let mk_unary_update_expr (op : unop) (exp : expr) =
  match exp with
  | Var _ -> mk_unop_expr op exp
  | _ -> failwith "unary increment/decrement can only be applied to variables"
