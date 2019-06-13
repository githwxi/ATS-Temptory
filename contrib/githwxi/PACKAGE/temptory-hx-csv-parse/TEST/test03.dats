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
//
impltmp
$CSVPARLN.csv_parse_line$comma<>
  ((*void*)) =
(
$UN.cast{Intgte(1)}(char0_ord('\t'))
)
//
(* ****** ****** *)
//
val-
~lsome(inp) =
FILEref_open_opt
// (*
("./DATA/test02.csv", "r")
// *)
(*
("./DATA/class_download.csv", "r")
*)
//
val frows =
$CSVPAR.csv_parse_fileref_vt<>
  (inp)
val () =
(
  stream_vt_foreach0<x0>(frows)
) where
{
vtypedef x0 =
list0_vt(string_vt)
impltmp
list0_print$sep<>() = print(';')
impltmp
stream_vt_foreach0$work<x0>
  (x0) =
let
  val x1 =
  $UN.castvwtp1{list0(string)}(x0)
in
  free(x0) where
  {
    val () =
    $CSVPAR.csv_unparse_fields(x1)
  }
end
}
val ((*close*)) = FILEref_close(inp)
//
(* ****** ****** *)

(* end of [test03.dats] *)
