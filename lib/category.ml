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

let to_string = function
  | Emotes -> "emotes"
  | Translations -> "translations"
  | Asset_replacements -> "asset-replacements"
  | Cosmetics -> "cosmetics"
  | Furniture -> "furniture"
  | Moons -> "moons"
  | Monsters -> "monsters"
  | Items -> "items"
  | Equipment -> "equipment"
  | Suits -> "suits"
  | Server_side -> "serverside"
  | Client_side -> "clientside"
  | Melon_loader -> "melonloader"
  | Bep_in_ex -> "bepinex"
  | Audio -> "audio"
  | Misc -> "misc"
  | Libraries -> "libraries"
  | Tools -> "tools"
  | Modpacks -> "modpacks"
  | Mods -> "mods"
;;

let of_string x =
  String.lowercase x
  |> function
  | "emotes" -> Emotes
  | "translations" -> Translations
  | "asset-replacements" -> Asset_replacements
  | "cosmetics" -> Cosmetics
  | "furniture" -> Furniture
  | "moons" -> Moons
  | "monsters" -> Monsters
  | "items" -> Items
  | "equipment" -> Equipment
  | "suits" -> Suits
  | "serverside" -> Server_side
  | "clientside" -> Client_side
  | "melonloader" -> Melon_loader
  | "bepinex" -> Bep_in_ex
  | "audio" -> Audio
  | "misc" -> Misc
  | "libraries" -> Libraries
  | "tools" -> Tools
  | "modpacks" -> Modpacks
  | "mods" -> Mods
  | x -> raise_s [%message "invalid category" ~_:(x : string)]
;;
