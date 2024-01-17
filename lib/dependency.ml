open! Core
open! Async
open! Import

type t =
  { team : string
  ; name : string
  ; version : Version.t
  }
[@@deriving fields, sexp]

module Diff = struct
  type t =
    | Added of
        { dep : string
        ; version : Version.t
        }
    | Removed of
        { dep : string
        ; version : Version.t
        }
    | Changed of
        { dep : string
        ; before : Version.t
        ; after : Version.t
        }
  [@@deriving compare, sexp, variants]

  let diff lhs rhs =
    let to_map deps =
      List.map deps ~f:(fun { team; name; version } ->
        {%string|%{team}-%{name}|}, version)
      |> String.Map.of_alist_exn
    in
    let lhs = to_map lhs in
    let rhs = to_map rhs in
    Map.symmetric_diff lhs rhs ~data_equal:Version.equal
    |> Sequence.to_list
    |> List.map ~f:(function
      | dep, `Left version -> Removed { dep; version }
      | dep, `Right version -> Added { dep; version }
      | dep, `Unequal (before, after) -> Changed { dep; before; after })
  ;;

  let to_string = function
    | Added { dep; version } -> {%string|Added %{dep} at %{version#Version}|}
    | Removed { dep; version = _ } -> {%string|Removed %{dep}|}
    | Changed { dep; before; after } ->
      (match Version.compare before after with
       | 0 -> failwith "unreachable"
       | upgraded when upgraded < 0 ->
         {%string|Upgraded %{dep} from %{before#Version} to %{after#Version}|}
       | _ -> {%string|Downgraded %{dep} from %{before#Version} to %{after#Version}|})
  ;;

  let gen_report lhs rhs =
    let diffs = diff lhs rhs in
    List.sort diffs ~compare
    |> List.group ~break:(fun lhs rhs -> Variants.to_rank lhs <> Variants.to_rank rhs)
    |> List.map ~f:(fun l -> List.map l ~f:to_string |> String.concat ~sep:"\n")
    |> String.concat ~sep:"\n\n"
  ;;
end

let dep team name version = { team; name; version }
let gen_report = Diff.gen_report
let to_string { team; name; version } = [%string "%{team}-%{name}-%{version#Version}"]

let of_string version =
  let version = String.split version ~on:'-' in
  match version with
  | [ team; name; version ] -> { team; name; version = Version.of_string version }
  | x -> raise_s [%message "malformed dependency string" (x : string list)]
;;

let jsonaf_of_t t = `String (to_string t)

let t_of_jsonaf = function
  | `String version -> of_string version
  | x -> raise_s [%message "unexpected tag in dependency" (x : Jsonaf.t)]
;;
