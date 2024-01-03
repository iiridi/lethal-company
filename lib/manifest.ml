open! Core
open! Async
open! Import

type t =
  { name : string
  ; version_number : Version.t
  ; website_url : string
  ; description : string
  ; dependencies : Dependency.t list
  }
[@@deriving jsonaf, sexp]
