(* ****** ****** *)
//
// HX-2019-05-09:
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
val
abc = "abcdefghijklmnopqrstuvwxyz"
val
ABC =
(
list0_vt2t
(gseq_map_list<string><char><char>(abc))
) where
{
implement
gseq_map$fopr<char><char>(c0) = char0_toupper(c0)
}
//
(* ****** ****** *)

val () = println!("|", ABC, "| = ", length(ABC))

(* ****** ****** *)

(* end of [test05.dats] *)
