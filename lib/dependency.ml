open! Core
open! Async
open! Import

type t =
  { team : Team.t
  ; name : string
  ; version : Version.t
  }
[@@deriving sexp]

let dep team name version = { team; name; version }

let to_string { team; name; version } =
  [%string "%{team#Team}-%{name}-%{version#Version}"]
;;

let of_string version =
  let version = String.split version ~on:'-' in
  match version with
  | [ team; name; version ] ->
    { team = Team.of_string team; name; version = Version.of_string version }
  | x -> raise_s [%message "malformed dependency string" (x : string list)]
;;

let jsonaf_of_t t = `String (to_string t)

let t_of_jsonaf = function
  | `String version -> of_string version
  | x -> raise_s [%message "unexpected tag in dependency" (x : Jsonaf.t)]
;;
