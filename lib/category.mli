open! Core
open! Async
open! Import

type t =
  | Emotes
  | Translations
  | Asset_replacements
  | Cosmetics
  | Furniture
  | Moons
  | Monsters
  | Items
  | Equipment
  | Suits
  | Server_side
  | Client_side
  | Melon_loader
  | Bep_in_ex
  | Audio
  | Misc
  | Libraries
  | Tools
  | Modpacks
  | Mods
[@@deriving sexp]

include Stringable.S with type t := t
