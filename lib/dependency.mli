open! Core
open! Async
open! Import

type t [@@deriving jsonaf, sexp]

include Stringable.S with type t := t

val dep : string -> string -> Version.t -> t
val team : t -> string
val name : t -> string
val version : t -> Version.t
