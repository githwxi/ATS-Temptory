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
($list1{int}(1,2,3,4,5))
//
val ys = list0_permute(xs)
val ys = stream_vt_listize(ys)
val () =
println!("permute", xs, " = ", ys)
//
val ((*freed*)) = list0_vt_free(ys)
//
(* ****** ****** *)

(* end of [test07.dats] *)
