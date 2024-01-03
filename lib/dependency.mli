open! Core
open! Async
open! Import

type t [@@deriving jsonaf, sexp]

include Stringable.S with type t := t

val dep : Team.t -> string -> Version.t -> t
