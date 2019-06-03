(* ****** ****** *)
(*
HX:
For testing divconq
*)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

#staload "./../SATS/mylist.sats"
#staload "./../DATS/mylist.dats"

(* ****** ****** *)

implfun main1() = (0)

(* ****** ****** *)
//
val xs =
g0ofg1
($list1{int}(1,2,3,4,5,6))
val ys = list0_permute(xs)
val ys = stream_vt_listize(ys)
val n0 =
(
fix
f(x:int):int =>
if x > 0 then x*f(x-1) else 1)(6)
val () =
assertloc(length(ys) = n0)
val ((*freed*)) = list0_vt_free(ys)
//
(* ****** ****** *)

(* end of [test07.dats] *)
