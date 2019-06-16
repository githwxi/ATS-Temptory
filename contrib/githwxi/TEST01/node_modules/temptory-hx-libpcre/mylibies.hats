(* ****** ****** *)
//
// HX-2017-01-29:
// For downstream staloading
//
(* ****** ****** *)
//
#staload
PCRE = "./SATS/pcre.sats"
//
#staload
_(*PCRE*) = "./DATS/pcre.dats"
//
(* ****** ****** *)
//
fun
rematch
( regexp: string
, subject: string): sint =
(
$PCRE.regexp_match_string<>(regexp, subject)
)
//
(* ****** ****** *)
//
fun
rematch_sub
{n:int}
{st,ln:nat|st+ln <= n}
( regexp: string
, subject: string(n), start: sint(st), length: sint(ln)
) : sint =
(
$PCRE.regexp_match_substring<>(regexp, subject, start, length)
)
//
(* ****** ****** *)

(* end of [mylibies.hats] *)
