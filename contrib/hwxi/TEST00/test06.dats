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

#define N 10

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
val () =
(
gseq_foreach<int><int>(N)
) where
{
//
typedef xs = sint
typedef x0 = sint
//
implement
gseq_foreach$work<x0>(i0) = println!("i0 = ", i0)
//
} (* end of [val] *)
//
(* ****** ****** *)
//
val
fact =
(
gseq_foldleft<xs><x0><r0>(N, 1)
) where
{
//
typedef xs = sint
typedef x0 = sint
typedef r0 = sint
//
implement
gseq_foldleft$fopr<x0><r0>(r0, i0) = r0 * (i0+1)
} (* end of [val] *)
//
val ((*void*)) = println! ("fact(", N, ") = ", fact)
//
(* ****** ****** *)
//
val
fact =
(
gseq_foldright<xs><x0><r0>(N, 1)
) where
{
//
typedef xs = sint
typedef x0 = sint
typedef r0 = sint
//
implement
gseq_foldright$fopr<x0><r0>(i0, r0) = r0 * (i0+1)
} (* end of [val] *)
//
val ((*void*)) = println! ("fact(", N, ") = ", fact)
//
(* ****** ****** *)
//
fun
fact(n0: int): int =
(
gseq_foldleft<SINT2><x0><r0>(SINT2, 1)
) where
{
//
typedef x0 = sint
typedef r0 = sint
//
implement
SINT2_range$beg<>() = 0
implement
SINT2_range$end<>() = n0
//
implement
gseq_foldleft$fopr<x0><r0>(r0, i0) = r0 * (i0+1)
//
} (* end of [fact] *)
//
val
((*void*)) =
println! ("fact(", N, ") = ", fact(N))
//
(* ****** ****** *)
//
fun
fibo(n0: int): int =
(
(gseq_foldleft<SINT2><x0><r0>(SINT2, (0, 1))).0
) where
{
//
typedef x0 = sint
typedef r0 = (sint, sint)
//
implement
SINT2_range$beg<>() = 0
implement
SINT2_range$end<>() = n0
//
implement
gseq_foldleft$fopr<x0><r0>(r0, i0) = (r0.1, r0.0+r0.1)
//
} (* end of [fact] *)
//
val
((*void*)) =
println! ("fibo(", N, ") = ", fibo(N))
//
(* ****** ****** *)

(* end of [test06.dats] *)
