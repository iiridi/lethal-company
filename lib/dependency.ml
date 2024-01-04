open! Core
open! Async
open! Import

type t =
  { team : Team.t
  ; name : string
  ; version : Version.t
  }
[@@deriving fields, sexp]

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

module DiffMap = struct
  include Map.Make (struct
      type t = Team.t * string [@@deriving compare, sexp]
    end)

  let of_list ts = List.map ts ~f:(fun t -> (t.team, t.name), t.version) |> of_alist_exn
end

module Diff = struct
  type nonrec t =
    { added : t list
    ; removed : t list
    ; changed : (t * t) list
    }

  let diff ~prev ~next =
    let prev = DiffMap.of_list prev in
    let next = DiffMap.of_list next in
    Map.fold_symmetric_diff
      prev
      next
      ~data_equal:Version.equal
      ~init:{ added = []; removed = []; changed = [] }
      ~f:(fun { added; removed; changed } ((team, name), change) ->
        match change with
        | `Left version ->
          { added; changed; removed = { team; name; version } :: removed }
        | `Right version -> { removed; changed; added = { team; name; version } :: added }
        | `Unequal (prev, next) ->
          { removed
          ; added
          ; changed =
              ({ team; name; version = prev }, { team; name; version = next }) :: changed
          })
  ;;
end

let diff = Diff.diff
