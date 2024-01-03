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
     and static_dir = flag "-static-dir" (required string) ~doc:"static dir" in
     fun () ->
       let icon = [%string "%{static_dir}/icon.png"] in
       let readme = [%string "%{static_dir}/README.md"] in
       let pack = Manifest.pack version in
       let toml = Manifest.thunderstore_toml pack icon readme in
       print_endline toml;
       return ())
;;
