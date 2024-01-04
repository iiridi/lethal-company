open! Core
open! Async
open! Import

type t [@@deriving sexp]

include Stringable.S with type t := t

val dep : Team.t -> string -> Version.t -> t
val team : t -> Team.t
val name : t -> string
val version : t -> Version.t

module Diff : sig
  type nonrec t =
    { added : t list
    ; removed : t list
    ; changed : (t * t) list
    }
end

val diff : prev:t list -> next:t list -> Diff.t
