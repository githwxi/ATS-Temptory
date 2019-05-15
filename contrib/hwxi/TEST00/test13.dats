(* ****** ****** *)
//
// HX-2019-05-13:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
val-
~some_vt(fil) =
FILEptr0_open_opt("./test13.dats", "r")
//
val () =
println!
("nc(fil) = ", length(FILEptr0_streamize_char(fil)))
//
(* ****** ****** *)
//
val-
~some_vt(fil) =
FILEptr0_open_opt("./test13.dats", "r")
//
val () =
println!
("nl(fil) = ", length(FILEptr0_streamize_line(fil)))
//
(* ****** ****** *)

(* end of [test13.dats] *)
