(lang dune 3.20)

(using menhir 3.0)

(name subc)

(generate_opam_files true)

(source
 (github joshuanunn/sub-c))

(authors "Joshua Nunn <joshuanunn@hotmail.co.uk>")

(maintainers "Joshua Nunn <joshuanunn@hotmail.co.uk>")

(license MIT)

(formatting
 (enabled_for ocaml))

(package
 (name subc)
 (synopsis "A short synopsis")
 (description "A longer description")
 (depends
  (ocaml
   (>= 4.14.0))
  ocamlformat
  dune
  menhir
  ppx_deriving
  ppx_expect
  ppx_inline_test))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/reference/dune-project/index.html
