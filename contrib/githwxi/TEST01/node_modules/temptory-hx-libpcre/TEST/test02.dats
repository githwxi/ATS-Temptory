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

implfun
main0() = () where
{
//
val
subj =
"http://www.ats-lang.org"
//
val
ret01 =
$PCRE.regexp_match_string
("\\..*\\.", subj)
val () =
println!("ret01 = ", ret01)
//
var ibeg2: int
and iend2: int
val ret02 =
$PCRE.regexp_match2_string
("\\..*\\.", subj, ibeg2, iend2)
//
val () =
println!("ret02 = ", ret02)
val () =
println!
("ibeg2 = ", ibeg2, " and iend2 = ", iend2)
//
val () = assertloc(ibeg2 >= 0)
//
val subj2 =
string1_make_substring
(subj, ibeg2, iend2-ibeg2)
val ((*void*)) = println! ("subj2 = ", subj2)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test02.dats] *)
