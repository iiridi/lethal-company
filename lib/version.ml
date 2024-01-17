open! Core
open! Async
open! Import

type t =
  { major : int
  ; minor : int
  ; patch : int
  }
[@@deriving compare, equal, sexp]

let v major minor patch = { major; minor; patch }
let to_string { major; minor; patch } = [%string "%{major#Int}.%{minor#Int}.%{patch#Int}"]

let of_string version =
  let version = String.split version ~on:'.' in
  match version with
  | [ major; minor; patch ] ->
    { major = int_of_string major
    ; minor = int_of_string minor
    ; patch = int_of_string patch
    }
  | x -> raise_s [%message "malformed version string" (x : string list)]
;;

let jsonaf_of_t t = `String (to_string t)

let t_of_jsonaf = function
  | `String version -> of_string version
  | x -> raise_s [%message "unexpected tag in version" (x : Jsonaf.t)]
;;
