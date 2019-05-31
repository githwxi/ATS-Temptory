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

#include "./../mylibies.hats"

(* ****** ****** *)

implement
main0 () = () where
{
//
val ret01 =
$PCRE.regexp_match_string
("http", "http://www.ats-lang.org")
val () = println! ("ret01(0) = ", ret01)
//
val ret02 =
$PCRE.regexp_match_string
("^http", "http://www.ats-lang.org")
val () = println! ("ret02(0) = ", ret02)
//
val ret11 =
$PCRE.regexp_match_string
("ats-lang", "http://www.ats-lang.org")
val () = println! ("ret11(0) = ", ret11)
//
val ret12 =
$PCRE.regexp_match_string
("^ats-lang", "http://www.ats-lang.org")
val () = println! ("ret12(-1) = ", ret12)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test01.dats] *)
