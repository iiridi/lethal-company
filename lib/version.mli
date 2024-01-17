open! Core
open! Async
open! Import

type t [@@deriving compare, equal, jsonaf, sexp]

include Stringable.S with type t := t

val v : int -> int -> int -> t
