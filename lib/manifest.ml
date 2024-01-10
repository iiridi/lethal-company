open! Core
open! Async
open! Import

type t =
  { name : string
  ; version_number : Version.t
  ; website_url : string
  ; description : string
  ; dependencies : Dependency.t list
  ; categories : Category.t list
  }
[@@deriving jsonaf, sexp]

let pack version_number =
  { name = "OSHAViolation"
  ; version_number
  ; website_url = "https://github.com/iiridi/lethal-company"
  ; description = "A modpack that's not compliant with OSHA 3348-05"
  ; dependencies =
      (let d = Dependency.dep in
       let v = Version.v in
       [ d "5Bit" "VoiceHUD" (v 1 0 4)
       ; d "AbyssalCompanyTeam" "AbyssalAudio" (v 1 1 4)
       ; d "akechii" "DiscountAlert" (v 2 3 0)
       ; d "AgentRev" "ShootableMouthDogs" (v 1 0 1)
       ; d "axd1x8a" "LCAmmoCheck" (v 1 0 0)
       ; d "BepInEx" "BepInExPack" (v 5 4 2100)
       ; d "blink9803" "DimmingFlashlights" (v 1 0 1)
       ; d "BlueAmulet" "LCBetterClock" (v 1 0 3)
       ; d "Bobbie" "FixRPCLag" (v 1 0 1)
       ; d "Clementinise" "CustomSounds" (v 2 2 0)
       ; d "darmuh" "darmuhsTerminalStuff" (v 2 2 2)
       ; d "darmuh" "ghostCodes" (v 1 1 0)
       ; d "Dev1A3" "ScannableCodes" (v 1 0 2)
       ; d "Dreamweave" "CompanyBuildingEnhancements" (v 2 5 0)
       ; d "e3s1" "BetterLadders" (v 1 3 0)
       ; d "EladNLG" "EladsHUD" (v 1 2 1)
       ; d "Electric131" "OuijaBoard" (v 1 5 1)
       ; d "EliteMasterEric" "Coroner" (v 1 5 3)
       ; d "EliteMasterEric" "SlimeTamingFix" (v 1 0 2)
       ; d "Evaisa" "HookGenPatcher" (v 0 0 5)
       ; d "Evaisa" "LethalLib" (v 0 11 1)
       ; d "Evaisa" "LethalThings" (v 0 8 8)
       ; d "extraes" "LethalLoudnessMeter" (v 1 0 1)
       ; d "F4ilS4fe" "MaskTheDead" (v 1 0 5)
       ; d "femboytv" "LethalPosters" (v 1 2 0)
       ; d "FlipMods" "FasterItemDropship" (v 1 2 1)
       ; d "FlipMods" "LetMeLookDown" (v 1 0 1)
       ; d "FlipMods" "ReservedFlashlightSlot" (v 1 5 7)
       ; d "FlipMods" "ReservedItemSlotCore" (v 1 7 4)
       ; d "FlipMods" "ReservedWalkieSlot" (v 1 5 3)
       ; d "FlipMods" "TooManyEmotes" (v 1 7 7)
       ; d "freesnow" "CollectYourDead" (v 1 0 0)
       ; d "fumiko" "BetterMonitor" (v 0 1 3)
       ; d "FutureSavior" "Hold_Scan_Button" (v 1 1 1)
       ; d "HomelessGinger" "MaskedEnemyOverhaul" (v 2 4 1)
       ; d "IntegrityChaos" "Diversity" (v 1 1 10)
       ; d "itsmeowdev" "DoorFix" (v 1 0 0)
       ; d "Jamil" "Corporate_Restructure" (v 1 0 6)
       ; d "Jordo" "NeedyCats" (v 1 1 1)
       ; d "JunLethalCompany" "GamblingMachineAtTheCompany" (v 1 2 3)
       ; d "Kittenji" "LaserPointerDetonator" (v 1 0 0)
       ; d "kRYstall9" "FastSwitchPlayerViewInRadar" (v 1 3 2)
       ; d "kuba6000" "LC_Masked_Fix" (v 0 0 2)
       ; d "kyxino" "LethalUtilities" (v 1 2 13)
       ; d "loaforc" "FacilityMeltdown" (v 1 1 3)
       ; d "MegaPiggy" "BuyableShotgunShells" (v 1 0 1)
       ; d "Mugen" "FreeJesterPlus" (v 1 0 0)
       ; d "monkes_mods" "JumpDelayPatch" (v 1 0 1)
       ; d "MrHydralisk" "EnhancedLockpicker" (v 1 1 3)
       ; d "MrHydralisk" "EnhancedRadarBooster" (v 1 5 4)
       ; d "mrov" "LethalRichPresence" (v 0 5 3)
       ; d "Nebulaetrix" "ScanFix" (v 1 0 3)
       ; d "NiceHairs" "NuclearLib" (v 1 0 4)
       ; d "NiceHairs" "Symbiosis" (v 1 0 5)
       ; d "no00ob" "LCSoundTool" (v 1 4 0)
       ; d "NotAtomicBomb" "TerminalApi" (v 1 5 0)
       ; d "NutNutty" "SellTracker" (v 1 1 0)
       ; d "OnionMilk" "crosshair" (v 1 0 1)
       ; d "Owen3H" "IntroTweaks" (v 1 4 1)
       ; d "Ozone" "BepInUtils" (v 1 2 1)
       ; d "Ozone" "Runtime_Netcode_Patcher" (v 0 2 5)
       ; d "PC" "FireExitFlip" (v 1 0 0)
       ; d "Pinta" "PintoBoy" (v 1 0 3)
       ; d "Pooble" "LCBetterSaves" (v 1 7 0)
       ; d "PostMortem" "BetterLightning" (v 1 0 3)
       ; d "PotatoePet" "AdvancedCompany" (v 1 0 104)
       ; d "quackandcheese" "MirrorDecor" (v 1 2 3)
       ; d "quackinggander" "SCPPosters" (v 1 1 1)
       ; d "RickArg" "Helmet_Cameras" (v 2 1 5)
       ; d "RedCrowbar" "BuffedPresents" (v 0 0 5)
       ; d "Rozebud" "FOV_Adjust" (v 1 1 1)
       ; d "RugbugRedfern" "Skinwalkers" (v 2 0 5)
       ; d "Rune580" "LethalCompany_InputUtils" (v 0 4 4)
       ; d "Spyci" "CozyImprovements" (v 1 2 1)
       ; d "SpyPlayer" "DoomShotgun" (v 1 0 0)
       ; d "stefan750" "LCUltrawide" (v 1 1 1)
       ; d "sunnobunno" "ScalingStartCredits" (v 1 0 1)
       ; d "sunnobunno" "YippeeMod" (v 1 2 3)
       ; d "Suskitech" "AlwaysHearActiveWalkies" (v 1 4 4)
       ; d "Sv_Matt" "HideModList" (v 1 0 1)
       ; d "taffyko" "BetterSprayPaint" (v 1 1 0)
       ; d "taffyko" "NameplateTweaks" (v 1 0 6)
       ; d "taffyko" "NiceChat" (v 1 2 4)
       ; d "TeamClark" "TheMostLethalCOSMETICS" (v 1 5 0)
       ; d "TheDeadSnake" "Touchscreen" (v 1 0 8)
       ; d "TheFluff" "FairAI" (v 1 2 8)
       ; d "Toskan4134" "LethalRegeneration" (v 1 2 0)
       ; d "TwinDimensionalProductions" "CoilHeadStare" (v 1 0 3)
       ; d "ViViKo" "NoSellLimit" (v 1 0 1)
       ; d "willis81808" "HackPad" (v 1 1 3)
       ; d "willis81808" "LethalSettings" (v 1 3 0)
       ; d "Woecust" "Immersive_Visor" (v 0 1 601)
       ; d "x753" "Mimics" (v 2 3 2)
       ])
  ; categories = Category.[ Modpacks ]
  }
;;

let thunderstore_toml t =
  let deps =
    List.map t.dependencies ~f:(fun dep ->
      let team = Dependency.team dep in
      let name = Dependency.name dep in
      let ver = Dependency.version dep in
      [%string {|%{team}-%{name} = "%{ver#Version}"|}])
    |> List.sort ~compare:String.compare
    |> String.concat ~sep:"\n"
  in
  let categories =
    List.map t.categories ~f:(fun category -> [%string {|"%{category#Category}"|}])
    |> String.concat ~sep:", "
  in
  [%string
    {|[config]
schemaVersion = "0.0.1"

[package]
namespace = "iiri"
name = "%{t.name}"
versionNumber = "%{t.version_number#Version}"
description = "%{t.description}"
websiteUrl = "%{t.website_url}"
containsNsfwContent = false
[package.dependencies]
%{deps}


[build]
icon = "./icon.png"
readme = "./README.md"
outdir = "./build"


[publish]
repository = "https://thunderstore.io"
communities = ["lethal-company"]
[publish.categories]
lethal-company = [%{categories}]
|}]
;;
