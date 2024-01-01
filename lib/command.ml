open! Core
open! Async
open! Import

let command =
  Command.async
    ~summary:"lethal_company"
    (let%map_open.Command () = return () in
     fun () ->
       print_endline "sd";
       print_endline "hello";
       return ())
;;
