(* ****** ****** *)

(*
** For testing csv_parse
*)

(* ****** ****** *)

implement main1() = 0

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

#staload CSVPAR = $CSV_PARSE
#staload CSVPARLN = $CSV_PARSE_LINE

(* ****** ****** *)

val-
~lsome(inp) =
FILEref_open_opt
// (*
("./DATA/test02.csv", "r")
// *)
(*
("./DATA/class_download.csv", "r")
*)

(* ****** ****** *)
//
implement
$CSVPARLN.csv_parse_line$comma<>
  ((*void*)) =
(
$UN.cast{Intgte(1)}(char0_ord('\t'))
)
//
(* ****** ****** *)

val frows =
$CSVPAR.csv_parse_fileref_vt<>
  (inp)
val ((*void*)) =
(
  stream_vt_foreach0<x0>(frows)
) where
{
vtypedef x0 = list0_vt(string_vt)
implement
list0_print$sep<>() = print(';')
implement
stream_vt_foreach0$work<x0>(x0) = (println!(x0); free(x0))
}

(* ****** ****** *)

val ((*close*)) = FILEref_close(inp)

(* ****** ****** *)

(* end of [test02.dats] *)
