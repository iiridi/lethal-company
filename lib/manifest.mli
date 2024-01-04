open! Core
open! Async
open! Import

type t [@@deriving sexp]

val pack : Version.t -> t
val thunderstore_toml : t -> string
