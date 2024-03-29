open! Core
open! Async
open! Import

type t [@@deriving jsonaf, sexp]

val dependencies : t -> Dependency.t list
val pack : Version.t -> t
val thunderstore_toml : t -> string
