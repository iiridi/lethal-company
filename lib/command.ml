open! Core
open! Async
open! Import

let toml =
  Command.async
    ~summary:"lethal_company"
    (let%map_open.Command version =
       anon ("version" %: Arg_type.map string ~f:Version.of_string)
     in
     fun () ->
       let pack = Manifest.pack version in
       let toml = Manifest.thunderstore_toml pack in
       print_endline toml;
       return ())
;;

let dump_manifest =
  Command.async
    ~summary:"dump manifest"
    (let%map_open.Command version =
       anon ("version" %: Arg_type.map string ~f:Version.of_string)
     in
     fun () ->
       let pack = Manifest.pack version in
       print_s ([%sexp_of: Manifest.t] pack);
       return ())
;;

let command =
  Command.group ~summary:"lethal_company" [ "toml", toml; "manifest", dump_manifest ]
;;
