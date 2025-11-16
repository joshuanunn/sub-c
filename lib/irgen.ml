let identifier_to_string = function
  | Ast.Identifier s -> s
  | _ -> failwith "expected Identifier"

let update_op (u : Ast.unop) : Ir.binary_operator =
  match u with
  | PreIncrement -> Add
  | PreDecrement -> Subtract
  | PostIncrement -> Add
  | PostDecrement -> Subtract
  | _ -> failwith "cannot map AST unary update operator to IR binary operator"

let convert_unop (u : Ast.unop) : Ir.unary_operator =
  match u with
  | BwNot -> BwNot
  | Negate -> Negate
  | Not -> Not
  | PreIncrement -> PreIncrement
  | PreDecrement -> PreDecrement
  | PostIncrement -> PostIncrement
  | PostDecrement -> PostDecrement

let convert_binop (u : Ast.binop) : Ir.binary_operator =
  match u with
  | Add -> Add
  | Subtract -> Subtract
  | Multiply -> Multiply
  | Divide -> Divide
  | Remainder -> Remainder
  | BwLeftShift -> BwLeftShift
  | BwRightShift -> BwRightShift
  | BwAnd -> BwAnd
  | BwXor -> BwXor
  | BwOr -> BwOr
  | Equal -> Equal
  | NotEqual -> NotEqual
  | LessOrEqual -> LessOrEqual
  | GreaterOrEqual -> GreaterOrEqual
  | LessThan -> LessThan
  | GreaterThan -> GreaterThan
  | _ -> failwith "cannot compile AST binary operator to IR binary"

(** Collect all [case] and [default] labels inside a statement AST node. *)
let rec collect_cases (s : Ast.stmt) : (Ast.expr option * string) list =
  match s with
  | Case { value; body; id = Some (SwitchLabel i) } ->
      let int_value = Ast.literal_to_int value in
      let label_name = Printf.sprintf "swit.cs.%s.%d" i int_value in
      let subcases = collect_cases body in
      (Some value, label_name) :: subcases
  | Default { body; id = Some (SwitchLabel i) } ->
      let label_name = Printf.sprintf "swit.df.%s" i in
      let subcases = collect_cases body in
      (None, label_name) :: subcases
  | Compound (Ast.Block items) ->
      List.concat_map
        (function Ast.S s -> collect_cases s | Ast.D _ -> [])
        items
  | If { then_smt; else_smt; _ } -> (
      collect_cases then_smt
      @ match else_smt with Some e -> collect_cases e | None -> [])
  | While { body; _ } | DoWhile { body; _ } | For { body; _ } ->
      collect_cases body
  | Label (_, s) -> collect_cases s
  | _ -> []

let rec convert_expr (e : Ast.expr) (le : Env.lenv) :
    Ir.value * Ir.instruction list =
  match e with
  | LiteralInt n -> (Constant n, [])
  (* Insert any AST Vars into IR Vars, as names are gaurunteed unique *)
  | Var id -> (
      match id with
      | Identifier v -> (Var v, [])
      | _ -> failwith "Var name must be Identifier")
  | Unary { op : Ast.unop; exp : Ast.expr } -> (
      let src, src_instructions = convert_expr exp le in
      match op with
      (* Pre-update unary ops: adjust variable and return updated value *)
      | PreIncrement | PreDecrement ->
          let ins_adjust_var =
            Ir.Binary
              { op = update_op op; src1 = src; src2 = Constant 1; dst = src }
          in
          (src, [ ins_adjust_var ])
      (* Post-update unary ops: adjust variable and return original value *)
      | PostIncrement | PostDecrement ->
          let tmp = Ir.Var (Env.declare_value "tmp" le) in
          let ins_copy_tmp = Ir.Copy { src; dst = tmp } in
          let ins_adjust_var =
            Ir.Binary
              { op = update_op op; src1 = src; src2 = Constant 1; dst = src }
          in
          (tmp, [ ins_copy_tmp ] @ [ ins_adjust_var ])
      (* Everything else *)
      | _ ->
          let tmp = Ir.Var (Env.declare_value "tmp" le) in
          let instruction = Ir.Unary { op = convert_unop op; src; dst = tmp } in
          (tmp, src_instructions @ [ instruction ]))
  | Binary { op = And; left : Ast.expr; right : Ast.expr } ->
      let lhs, lhs_ins = convert_expr left le in
      let rhs, rhs_ins = convert_expr right le in
      let dst = Ir.Var (Env.declare_value "tmp" le) in
      let lbs = Env.declare_label "and.fl" le in
      let lbe = Env.declare_label "and.en" le in
      let jzl = Ir.JumpIfZero { condition = lhs; target = lbs } in
      let jzr = Ir.JumpIfZero { condition = rhs; target = lbs } in
      let c1 = Ir.Copy { src = Constant 1; dst } in
      let je = Ir.Jump { target = lbe } in
      let c0 = Ir.Copy { src = Constant 0; dst } in
      ( dst,
        lhs_ins @ [ jzl ] @ rhs_ins
        @ [ jzr; c1; je; Ir.Label lbs; c0; Ir.Label lbe ] )
  | Binary { op = Or; left : Ast.expr; right : Ast.expr } ->
      let lhs, lhs_ins = convert_expr left le in
      let rhs, rhs_ins = convert_expr right le in
      let dst = Ir.Var (Env.declare_value "tmp" le) in
      let lbs = Env.declare_label "or.tr" le in
      let lbe = Env.declare_label "or.en" le in
      let jzl = Ir.JumpIfNotZero { condition = lhs; target = lbs } in
      let jzr = Ir.JumpIfNotZero { condition = rhs; target = lbs } in
      let c0 = Ir.Copy { src = Constant 0; dst } in
      let je = Ir.Jump { target = lbe } in
      let c1 = Ir.Copy { src = Constant 1; dst } in
      ( dst,
        lhs_ins @ [ jzl ] @ rhs_ins
        @ [ jzr; c0; je; Ir.Label lbs; c1; Ir.Label lbe ] )
  | Binary { op : Ast.binop; left : Ast.expr; right : Ast.expr } ->
      let op = convert_binop op in
      let src1, src1_instructions = convert_expr left le in
      let src2, src2_instructions = convert_expr right le in
      let dst = Ir.Var (Env.declare_value "tmp" le) in
      let instruction = Ir.Binary { op; src1; src2; dst } in
      (dst, src1_instructions @ src2_instructions @ [ instruction ])
  | Assignment (lhs, rhs) ->
      let result, ins_eval_result = convert_expr rhs le in
      let var, _ = convert_expr lhs le in
      let ins_copy_result = Ir.Copy { src = result; dst = var } in
      (var, ins_eval_result @ [ ins_copy_result ])
  | Conditional { cond_exp; then_exp; else_exp } ->
      let result = Ir.Var (Env.declare_value "tmp" le) in
      let cond, cond_ins = convert_expr cond_exp le in
      let l_end = Env.declare_label "cond.en" le in
      let l_e2 = Env.declare_label "cond.el" le in
      let jz_cond = Ir.JumpIfZero { condition = cond; target = l_e2 } in
      let v1, e1_ins = convert_expr then_exp le in
      let c1 = Ir.Copy { src = v1; dst = result } in
      let j_end = Ir.Jump { target = l_end } in
      let v2, e2_ins = convert_expr else_exp le in
      let c2 = Ir.Copy { src = v2; dst = result } in
      ( result,
        cond_ins @ [ jz_cond ] @ e1_ins
        @ [ c1; j_end; Ir.Label l_e2 ]
        @ e2_ins @ [ c2; Ir.Label l_end ] )
  | FunctionCall _ -> failwith "TODO"

let rec convert_stmt (s : Ast.stmt) (le : Env.lenv) : Ir.instruction list =
  match s with
  | Return v ->
      let value, instructions = convert_expr v le in
      instructions @ [ Return value ]
  | Expression v ->
      let _, instructions = convert_expr v le in
      instructions
  | If { cond_exp; then_smt; else_smt = None } ->
      let cond, cond_ins = convert_expr cond_exp le in
      let l_end = Env.declare_label "if.en" le in
      let jz_cond = Ir.JumpIfZero { condition = cond; target = l_end } in
      let then_ins = convert_stmt then_smt le in
      cond_ins @ [ jz_cond ] @ then_ins @ [ Ir.Label l_end ]
  | If { cond_exp; then_smt; else_smt = Some s } ->
      let cond, cond_ins = convert_expr cond_exp le in
      let l_end = Env.declare_label "if.en" le in
      let l_else = Env.declare_label "if.el" le in
      let jz_cond = Ir.JumpIfZero { condition = cond; target = l_else } in
      let then_ins = convert_stmt then_smt le in
      let j_end = Ir.Jump { target = l_end } in
      let else_ins = convert_stmt s le in
      cond_ins @ [ jz_cond ] @ then_ins @ [ j_end; Ir.Label l_else ] @ else_ins
      @ [ Ir.Label l_end ]
  | Compound b ->
      let (Block items) = b in
      List.map
        (fun node ->
          match node with
          | Ast.S s -> convert_stmt s le
          | Ast.D d -> convert_dclr d le)
        items
      |> List.flatten
  | Break id -> (
      match id with
      | Some (LoopLabel i) -> [ Jump { target = "loop.br." ^ i } ]
      | Some (SwitchLabel i) -> [ Jump { target = "swit.br." ^ i } ]
      | _ -> failwith "break statement has missing label")
  | Continue id -> (
      match id with
      | Some (LoopLabel i) -> [ Jump { target = "loop.ct." ^ i } ]
      | _ -> failwith "continue statement has missing label")
  | While { cond; body; id } -> (
      match id with
      | Some (LoopLabel i) ->
          let l_continue = "loop.ct." ^ i in
          let l_break = "loop.br." ^ i in
          let cond, cond_ins = convert_expr cond le in
          let jz_cond = Ir.JumpIfZero { condition = cond; target = l_break } in
          let body_ins = convert_stmt body le in
          let j_continue = Ir.Jump { target = l_continue } in
          [ Ir.Label l_continue ] @ cond_ins @ [ jz_cond ] @ body_ins
          @ [ j_continue ] @ [ Ir.Label l_break ]
      | _ -> failwith "while statement has missing label")
  | DoWhile { body; cond; id } -> (
      match id with
      | Some (LoopLabel i) ->
          let l_start = "loop.st." ^ i in
          let body_ins = convert_stmt body le in
          let cond, cond_ins = convert_expr cond le in
          let jz_cond =
            Ir.JumpIfNotZero { condition = cond; target = l_start }
          in
          [ Ir.Label l_start ] @ body_ins
          @ [ Ir.Label ("loop.ct." ^ i) ]
          @ cond_ins @ [ jz_cond ]
          @ [ Ir.Label ("loop.br." ^ i) ]
      | _ -> failwith "dowhile statement has missing label")
  | For { init; cond; post; body; id } -> (
      match id with
      | Some (LoopLabel i) ->
          let l_break = "loop.br." ^ i in
          let init_ins = convert_for_init init le in
          let l_start = "loop.st." ^ i in
          let cond_ins = convert_for_cond cond l_break le in
          let body_ins = convert_stmt body le in
          let post_ins = convert_for_post post le in
          let j_start = Ir.Jump { target = l_start } in
          init_ins @ [ Ir.Label l_start ] @ cond_ins @ body_ins
          @ [ Ir.Label ("loop.ct." ^ i) ]
          @ post_ins @ [ j_start ] @ [ Ir.Label l_break ]
      | _ -> failwith "for statement has missing label")
  | Switch { cond; body; id } -> (
      match id with
      | Some (SwitchLabel i) ->
          let switch_break = "swit.br." ^ i in
          let cond_val, cond_ins = convert_expr cond le in

          (* Collect all linked case and default labels *)
          let cases = collect_cases body in

          let default_label =
            match List.find_opt (fun (v, _) -> v = None) cases with
            | Some (_, lbl) -> Some lbl
            | None -> None
          in
          let cases_only =
            List.filter_map
              (function Some v, lbl -> Some (v, lbl) | None, _ -> None)
              cases
          in

          let dispatch_ins =
            List.concat_map
              (fun (v, lbl) ->
                let tmp = Ir.Var (Env.declare_value "tmp" le) in
                [
                  Ir.Binary
                    {
                      op = Ir.Equal;
                      src1 = cond_val;
                      src2 = Constant (Ast.literal_to_int v);
                      dst = tmp;
                    };
                  Ir.JumpIfNotZero { condition = tmp; target = lbl };
                ])
              cases_only
          in

          let jmp_default =
            match default_label with
            | Some lbl -> [ Ir.Jump { target = lbl } ]
            | None -> [ Ir.Jump { target = switch_break } ]
          in

          let body_ins = convert_stmt body le in

          cond_ins @ dispatch_ins @ jmp_default @ body_ins
          @ [ Ir.Label switch_break ]
      | _ -> failwith "case statement has missing label")
  | Case { value; body; id } -> (
      match id with
      | Some (SwitchLabel i) ->
          let int_value = Ast.literal_to_int value in
          let l_case = Printf.sprintf "swit.cs.%s.%d" i int_value in
          let body_ins = convert_stmt body le in
          [ Ir.Label l_case ] @ body_ins
      | _ -> failwith "case statement has missing label")
  | Default { body; id } -> (
      match id with
      | Some (SwitchLabel i) ->
          let l_case = "swit.df." ^ i in
          let body_ins = convert_stmt body le in
          [ Ir.Label l_case ] @ body_ins
      | _ -> failwith "default statement has missing label")
  | Goto id -> (
      match id with
      | GotoLabel id -> [ Jump { target = id } ]
      | _ -> failwith "goto statement has missing label")
  | Label (id, next_stmt) -> (
      match id with
      | GotoLabel name -> [ Ir.Label name ] @ convert_stmt next_stmt le
      | _ -> failwith "label statement has missing label")
  | Null -> []

and convert_dclr (d : Ast.decl) (le : Env.lenv) : Ir.instruction list =
  match d with
  | FunDecl _ -> failwith "TODO"
  (* No need to generate instructions for variable declaration *)
  | VarDecl { name; init = None } ->
      Env.insert_value name le;
      []
  (* Handle a declaration with initialiser as an assignment expression *)
  | VarDecl { name; init = Some rhs } ->
      Env.insert_value name le;
      let initialiser = Ast.Assignment (Ast.Var name, rhs) in
      let _, instructions = convert_expr initialiser le in
      instructions

and convert_for_init (i : Ast.for_init) (le : Env.lenv) : Ir.instruction list =
  match i with
  (* No need to generate instructions for variable declaration *)
  | InclDecl { name; init = None } ->
      Env.insert_value name le;
      []
  (* Handle a declaration with initialiser as an assignment expression *)
  | InclDecl { name; init = Some rhs } ->
      Env.insert_value name le;
      let initialiser = Ast.Assignment (Ast.Var name, rhs) in
      let _, instructions = convert_expr initialiser le in
      instructions
  | InitExp (Some e) ->
      let _, ins = convert_expr e le in
      ins
  | InitExp None -> []

and convert_for_cond (e : Ast.expr option) (exit_target : string)
    (le : Env.lenv) : Ir.instruction list =
  match e with
  | Some exp ->
      let cond, cond_ins = convert_expr exp le in
      let jz_cond = Ir.JumpIfZero { condition = cond; target = exit_target } in
      cond_ins @ [ jz_cond ]
  | None -> []

and convert_for_post (e : Ast.expr option) (le : Env.lenv) : Ir.instruction list
    =
  match e with
  | Some exp ->
      let _, ins = convert_expr exp le in
      ins
  | None -> []

and convert_func (f : Ast.fun_decl) (le : Env.lenv) : Ir.func =
  let block_items =
    match f.body with Some (Block items) -> items | None -> []
  in
  let body =
    List.map
      (fun node ->
        match node with
        | Ast.S s -> convert_stmt s le
        | Ast.D d -> convert_dclr d le)
      block_items
    |> List.flatten
  in
  (* Append "return 0" to the function end, in case no return present *)
  let body_safe_return = body @ [ Return (Constant 0) ] in
  Function { name = identifier_to_string f.name; body = body_safe_return }

let convert_prog (Program p : Ast.prog) (le : Env.lenv) : Ir.prog =
  let resolved_funcs =
    List.map
      (function
        | Ast.FunDecl f -> convert_func f le
        | Ast.VarDecl _ ->
            failwith "Global variable declaration not yet implemented")
      p
  in
  Program resolved_funcs
