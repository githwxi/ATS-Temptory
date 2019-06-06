(* ****** ****** *)
//
// For testing
// the API in ATS for pcre
//
(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

#include
"./../mylibies.hats"

(* ****** ****** *)

val () =
{
//
val () =
println!("The pcre version is ", $PCRE.pcre_version())
//
} (* end of [val] *)

(* ****** ****** *)

implement main0 () = ()

(* ****** ****** *)

(* end of [test00.dats] *)
