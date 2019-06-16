(* ****** ****** *)
(*
** For testing
** temptory-hx-csv-parse
*)
(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

val () =
println!
("Hello from [test01]!")

(* ****** ****** *)

#include
"$TEMPTORYLOCS\
/temptory-hx-csv-parse/mylibies.hats"

(* ****** ****** *)

val-
~lsome(inp) =
FILEref_open_opt
("./DATA/test01.csv", "r")

(* ****** ****** *)

val frows =
$CSV_PARSE.csv_parse_fileref_vt<>(inp)
val ((*void*)) =
(
stream_vt_foreach0<x0>(frows)
) where
{
vtypedef x0 = list0_vt(string_vt)
impltmp
stream_vt_foreach0$work<x0>(x0) = (println!(x0); free(x0))
}

(* ****** ****** *)

(* end of [test01.dats] *)
