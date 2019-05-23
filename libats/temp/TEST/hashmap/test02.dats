(* ****** ****** *)
/*
HX: for testing [hashmap]
*/
(* ****** ****** *)

implement main1() = ( 0 )

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)
//
typedef k0 = string
typedef x0 = string
typedef kx = (k0, x0)
//
val
themap = hmapref_make<k0,x0>()
//
val-
~lnone() = insert_opt(themap, "a", "A")
val-
~lnone() = insert_opt(themap, "b", "B")
val-
~lnone() = insert_opt(themap, "c", "C")
val-
~lnone() = insert_opt(themap, "d", "D")
val-
~lnone() = insert_opt(themap, "e", "E")
val-
~lnone() = insert_opt(themap, "f", "F")
//
val ((*void*)) =
println!("themap = ", themap)
val ((*void*)) =
println!("size(themap) = ", size(themap))
//
val-true = remove(themap, "a")
val-true = remove(themap, "b")
val-false = remove(themap, "x")
val-false = remove(themap, "y")
val-
~lnone() = insert_opt(themap, "x", "X")
val-
~lnone() = insert_opt(themap, "y", "Y")
val-
~lsome("E") = insert_opt(themap, "e", "X")
val-
~lsome("F") = insert_opt(themap, "f", "Y")
//
val ((*void*)) =
println!("themap = ", themap)
val ((*void*)) =
println!("size(themap) = ", size(themap))
//
(* ****** ****** *)

(* end of [test02.dats] *)
