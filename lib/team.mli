open! Core
open! Async
open! Import

type t [@@deriving jsonaf, sexp]

include Stringable.S with type t := t

(* Constants *)
val _2018 : t
val _5bit : t
val alexcodesgames : t
val bepinex : t
val blink9803 : t
val blueamulet : t
val ctnoriginals : t
val darmuh : t
val dreamweave : t
val egeadam : t
val eladnlg : t
val electric131 : t
val elitemastereric : t
val evaisa : t
val extraes : t
val f4ils4fe : t
val femboytv : t
val flamango : t
val flipmods : t
val futuresaivor : t
val hexnet111 : t
val homelessginger : t
val integritychaos : t
val jamil : t
val jordo : t
val junlethalcompany : t
val kittenji : t
val kRYstall9 : t
val kuba6000 : t
val kyxino : t
val linkoid : t
val megapiggy : t
val monkesmods : t
val monkeytype : t
val mrhydralisk : t
val mrov : t
val nebulaetrix : t
val nicehairs : t
val notatomicbomb : t
val nutnutty : t
val owen3h : t
val ozone : t
val pinta : t
val pooble : t
val potatoepet : t
val quackandcheese : t
val qufix : t
val redeye : t
val rickarg : t
val rozebud : t
val rugbugredfern : t
val run580 : t
val silvercore : t
val sligili : t
val spyci : t
val stefan750 : t
val sunnobunno : t
val suskitech : t
val svmatt : t
val taffyko : t
val teamclark : t
val toskan4134 : t
val twindimensionalproductions : t
val verity : t
val viviko : t
val willis81808 : t
val x753 : t
