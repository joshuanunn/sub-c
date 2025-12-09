type storage_class = Static | Extern [@@deriving show]
type typ = Int [@@deriving show]

type specifier = SpecType of typ | SpecStorage of storage_class
[@@deriving show]

type ident =
  | Identifier of string
  | GotoLabel of string
  | LoopLabel of string
  | SwitchLabel of string
[@@deriving show]

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
  | Conditional of { cond_exp : expr; then_exp : expr; else_exp : expr }
  | FunctionCall of { name : ident; args : expr list }
[@@deriving show]

type stmt =
  | Return of expr
  | Expression of expr
  | If of { cond_exp : expr; then_smt : stmt; else_smt : stmt option }
  | Compound of block
  | Break of ident option
  | Continue of ident option
  | While of { cond : expr; body : stmt; id : ident option }
  | DoWhile of { body : stmt; cond : expr; id : ident option }
  | For of {
      init : for_init;
      cond : expr option;
      post : expr option;
      body : stmt;
      id : ident option;
    }
  | Switch of { cond : expr; body : stmt; id : ident option }
  | Case of { value : expr; body : stmt; id : ident option }
  | Default of { body : stmt; id : ident option }
  | Goto of ident
  | Label of ident * stmt
  | Null
[@@deriving show]

and decl = FunDecl of fun_decl | VarDecl of var_decl [@@deriving show]
and for_init = InclDecl of var_decl | InitExp of expr option [@@deriving show]
and block_item = S of stmt | D of decl [@@deriving show]
and block = Block of block_item list [@@deriving show]

and fun_decl = {
  name : ident;
  params : ident list;
  body : block option;
  storage : storage_class option;
}
[@@deriving show]

and var_decl = {
  name : ident;
  init : expr option;
  storage : storage_class option;
}
[@@deriving show]

type prog = Program of decl list [@@deriving show]

let literal_to_int : expr -> int = function
  | LiteralInt i -> i
  | _ -> failwith "expected LiteralInt"

type decl_specs = { spec_type : typ; spec_storage : storage_class option }
[@@deriving show]

let extract_specifiers (sl : specifier list) : decl_specs =
  let typ_opt = ref None in
  let storage_class_opt = ref None in

  List.iter
    (function
      | SpecType t -> begin
          match !typ_opt with
          | None -> typ_opt := Some t
          | Some _ -> failwith "Invalid type specifier"
        end
      | SpecStorage s -> begin
          match !storage_class_opt with
          | None -> storage_class_opt := Some s
          | Some _ -> failwith "Invalid storage class"
        end)
    sl;

  match !typ_opt with
  | None -> failwith "No type specifier"
  | Some t -> { spec_type = t; spec_storage = !storage_class_opt }

let mk_prog f = Program f

let mk_func_defn specs name params body =
  let ds = extract_specifiers specs in
  FunDecl { name; params; body = Some (Block body); storage = ds.spec_storage }

let mk_func_decl specs name params =
  let ds = extract_specifiers specs in
  FunDecl { name; params; body = None; storage = ds.spec_storage }

let mk_func_call name args = FunctionCall { name; args }
let mk_ident i = Identifier i
let mk_int_expr n = LiteralInt n
let mk_binop_expr op left right = Binary { op; left; right }
let mk_unop_expr op exp = Unary { op; exp }
let mk_assign_expr left right = Assignment (Var left, right)

let mk_cond_expr cond_exp then_exp else_exp =
  Conditional { cond_exp; then_exp; else_exp }

let mk_return_stmt s = Return s
let mk_expr_stmt s = Expression s
let mk_if_stmt i t e = If { cond_exp = i; then_smt = t; else_smt = e }
let mk_block_stmt l = Compound (Block l)
let mk_while_stmt c b = While { cond = c; body = b; id = None }
let mk_dowhile_stmt b c = DoWhile { body = b; cond = c; id = None }
let mk_empty_init_exp = InitExp None
let mk_init_exp e = InitExp (Some e)

let mk_for_stmt i c p b =
  For { init = i; cond = c; post = p; body = b; id = None }

let mk_goto_stmt l = Goto l
let mk_label_stmt l s = Label (l, s)
let mk_switch_stmt e s = Switch { cond = e; body = s; id = None }
let mk_case_stmt e s = Case { value = e; body = s; id = None }
let mk_default_stmt s = Default { body = s; id = None }

let mk_decl_init_stmt specs i v =
  let ds = extract_specifiers specs in
  { name = i; init = Some v; storage = ds.spec_storage }

let mk_decl_stmt specs i =
  let ds = extract_specifiers specs in
  { name = i; init = None; storage = ds.spec_storage }

let mk_stmt_block_item s = S s
let mk_decl_block_item d = D d

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
