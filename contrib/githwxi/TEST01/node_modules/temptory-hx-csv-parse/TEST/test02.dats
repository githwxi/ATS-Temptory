(* ****** ****** *)

(*
** For testing csv_parse
*)

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)
//
#include "./../mylibies.hats"
//
(* ****** ****** *)

implement main1() = 0

(* ****** ****** *)

val-
~lsome(inp) =
FILEref_open_opt
("./DATA/test02.csv", "r")

(* ****** ****** *)

val frows =
$CSV_PARSE.csv_parse_fileref_vt<>(inp)
val ((*void*)) =
(
stream_vt_foreach0<x0>(frows)
) where
{
vtypedef x0 = list0_vt(string_vt)
implement
stream_vt_foreach0$work<x0>(x0) = (println!(x0); free(x0))
}

(* ****** ****** *)

(* end of [test02.dats] *)
