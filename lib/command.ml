open! Core
open! Async
open! Import

let command =
  Command.async
    ~summary:"lethal_company"
    (let%map_open.Command version =
       flag
         "-version-str"
         (required (Arg_type.map string ~f:Version.of_string))
         ~doc:"version"
     in
     fun () ->
       let pack = Manifest.pack version in
       let toml = Manifest.thunderstore_toml pack in
       print_endline toml;
       return ())
;;
