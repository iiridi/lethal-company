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
  { name = "OSHAViolationCore"
  ; version_number
  ; website_url = "https://github.com/iiridi/lethal-company"
  ; description = "A modpack that's not compliant with OSHA 3348-05"
  ; dependencies =
      (let d = Dependency.dep in
       let v = Version.v in
       Team.
         [ d bepinex "BepInExPack" (v 5 4 2100)
         ; d mrov "LethalRichPresence" (v 0 5 1)
         ; d suskitech "AlwaysHearActiveWalkies" (v 1 4 3)
         ; d _5bit "VoiceHUD" (v 1 0 4)
         ; d flipmods "FasterItemDropship" (v 1 2 0)
         ; d flipmods "ReservedItemSlotCore" (v 1 7 4)
         ; d flipmods "ReservedFlashlightSlot" (v 1 5 5)
         ; d flipmods "ReservedWalkieSlot" (v 1 5 3)
         ; d pooble "LCBetterSaves" (v 1 6 1)
         ; d rozebud "FOV_Adjust" (v 1 1 1)
         ; d flipmods "LetMeLookDown" (v 1 0 1)
         ; d rickarg "Helmet_Cameras" (v 2 1 5)
         ; d sligili "More_Emotes" (v 1 2 2)
         ; d eladnlg "EladsHUD" (v 1 1 0)
         ; d elitemastereric "Coroner" (v 1 5 3)
         ; d ozone "Disregard_Early_Voting" (v 1 0 2)
         ; d extraes "LethalLoudnessMeter" (v 1 0 1)
         ; d ozone "BepInUtils" (v 1 2 1)
         ; d svmatt "HideModList" (v 1 0 1)
         ; d monkeytype "HidePlayerNames" (v 1 0 2)
         ; d x753 "Mimics" (v 2 3 0)
         ; d blueamulet "LCBetterClock" (v 1 0 3)
         ; d notatomicbomb "TerminalApi" (v 1 5 0)
         ; d darmuh "darmuhsTerminalStuff" (v 2 2 0)
         ; d sunnobunno "YippeeMod" (v 1 2 2)
         ; d elitemastereric "SlimeTamingFix" (v 1 0 2)
         ; d silvercore "Permanent_Ladder" (v 1 0 3)
         ; d kRYstall9 "FastSwitchPlayerViewInRadar" (v 1 3 2)
         ; d evaisa "LethalThings" (v 0 8 8)
         ; d evaisa "LethalLib" (v 0 10 1)
         ; d evaisa "HookGenPatcher" (v 0 0 5)
         ; d nutnutty "SellTracker" (v 1 0 0)
         ; d rugbugredfern "Skinwalkers" (v 2 0 1)
         ; d redeye "LethalAutocomplete" (v 0 3 0)
         ; d sunnobunno "ScalingStartCredits" (v 1 0 1)
         ; d homelessginger "MaskedEnemyOverhaul" (v 2 1 0)
         ; d stefan750 "LCUltrawide" (v 1 1 1)
         ; d megapiggy "BuyableShotgunShells" (v 1 0 1)
         ; d kyxino "LethalUtilities" (v 1 2 11)
         ; d rune580 "LethalCompany_InputUtils" (v 0 4 4)
         ; d blink9803 "DimmingFlashlights" (v 1 0 1)
         ; d quackandcheese "MirrorDecor" (v 1 2 1)
         ; d toskan4134 "LethalRegeneration" (v 1 1 1)
         ; d ctnoriginals "CrossHair" (v 1 0 4)
         ; d owen3h "IntroTweaks" (v 1 4 0)
         ; d twindimensionalproductions "CoilHeadStare" (v 1 0 3)
         ; d monkesmods "JumpDelayPatch" (v 1 0 1)
         ; d jamil "Corporate_Restructure" (v 1 0 5)
         ; d mrhydralisk "EnhancedRadarBooster" (v 1 5 0)
         ; d viviko "NoSellLimit" (v 1 0 0)
         ; d dreamweave "CompanyBuildingEnhancements" (v 2 2 0)
         ; d willis81808 "HackPad" (v 1 1 3)
         ; d pinta "PintoBoy" (v 1 0 3)
         ; d linkoid "DissonanceLagFix" (v 1 0 0)
         ; d futuresaivor "Hold_Scan_Button" (v 1 1 1)
         ; d nicehairs "Symbiosis" (v 1 0 5)
         ; d taffyko "BetterSprayPaint" (v 1 1 0)
         ; d f4ils4fe "MaskTheDead" (v 1 0 5)
         ; d willis81808 "LethalSettings" (v 1 3 0)
         ; d darmuh "ghostCodes" (v 1 1 0)
         ; d nebulaetrix "ScanFix" (v 1 0 3)
         ; d integritychaos "Diversity" (v 1 1 4)
         ; d jordo "NeedyCats" (v 1 0 2)
         ; d kittenji "LaserPointerDetonator" (v 1 0 0)
         ; d kuba6000 "LC_Masked_Fix" (v 0 0 1)
         ; d potatoepet "AdvancedCompany" (v 1 0 10)
         ; d spyci "CozyImprovements" (v 1 2 0)
         ; d electric131 "OuijaBoard" (v 1 5 0)
         ; d junlethalcompany "GamblingMachineAtTheCompany" (v 1 1 0)
         ; d postmortem "BetterLightning" (v 1 0 2)
         ; d akechii "DiscountAlert" (v 2 3 0)
         ; d thefluff "FairAi" (v 1 2 5)
         ; d taffyko "NiceChat" (v 1 2 3)
         ; d _5bit "FPSSpectate" (v 1 0 1)
         ; d nicehairs "NuclearLib" (v 1 0 4)
         ; d thedeadsnake "Touchscreen" (v 1 0 8)
         ; d itsmeowdev "DoorFix" (v 1 0 0)
         ; d sfdesat "Explorations" (v 1 3 1)
         ; d scoopy "Scoopys_Variety_Mod" (v 0 4 0)
         ; d teamclark "TheMostLethalCOSMETICS" (v 1 4 0)
         ; d femboytv "LethalPosters" (v 1 2 0)
         ; d quackinggander "SCPPosters" (v 1 1 1)
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
      [%string {|%{team#Team}-%{name} = "%{ver#Version}"|}])
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

[[build.copy]]
source = "./static"
target = ""


[publish]
repository = "https://thunderstore.io"
communities = ["lethal-company"]
[publish.categories]
lethal-company = [%{categories}]
|}]
;;
