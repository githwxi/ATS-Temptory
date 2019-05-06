(* ****** ****** *)
//
// HX-2019-05-05:
// For testing ATS-Temptory
//
(* ****** ****** *)
//
#staload
"libats/SATS/gint.sats"
//
(* ****** ****** *)
//
fun
fact
(x: int): int =
if x > 0 then x * fact(x-1) else 1
fun
fact
{i:nat}
(x: int(i)): int =
if x > 0 then x * fact(x-1) else 1
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test01.dats] *)
