open! Core
open! Async
open! Import

let diff =
  Command.async
    ~summary:"diff manifests"
    (let%map_open.Command before = flag "-before" (required string) ~doc:"before"
     and after = flag "-after" (required string) ~doc:"after" in
     fun () ->
       let read_manifest path =
         let%map str = Reader.file_contents path in
         let json = Jsonaf.of_string str in
         Manifest.t_of_jsonaf json
       in
       let%bind before = read_manifest before in
       let%bind after = read_manifest after in
       let diff =
         Dependency.gen_report
           (Manifest.dependencies before)
           (Manifest.dependencies after)
       in
       print_endline diff;
       return ())
;;

let gen =
  Command.async
    ~summary:"gen"
    (let%map_open.Command version =
       anon ("version" %: Arg_type.map string ~f:Version.of_string)
     in
     fun () ->
       let pack = Manifest.pack version in
       let toml = Manifest.thunderstore_toml pack in
       print_endline toml;
       return ())
;;

let command = Command.group ~summary:"lethal_company" [ "diff", diff; "gen", gen ]
