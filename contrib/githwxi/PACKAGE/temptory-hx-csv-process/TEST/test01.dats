(* ****** ****** *)
(*
HX: For testing WebAdMIT
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
#include 
"./../mylibies.hats"
#include 
"./../mydepies.hats"
#staload $CSV_PROCESS(*for opening NS*)
//
(* ****** ****** *)

#define MYDATA "./DATA/Accepted-06-06.csv"

(* ****** ****** *)
//
val
(
theColNames
,
theApplicants
) =
let
val-
~lsome(inp) =
FILEptr0_open_opt(MYDATA, "r")
in
(FILEptr0_streamize_tarr(inp))
end // end of [theApplicants]
//
val
theApplicants = tolist(theApplicants)
//
val () =
println!
("|theColNames| = ", length(theColNames))
val () =
println!
("|theApplicants| = ", length(theApplicants))
//
(* ****** ****** *)

val () =
(
list0_foreach(theApplicants)
) where
{
val n0 =
length(theColNames)
impltmp
list0_foreach$work<tarray0>(x0) = assertloc(n0 = length(x0))
}

(* ****** ****** *)

(* end of [test01.dats] *)
