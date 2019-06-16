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
val locstr = "\
/home/hwxi/research/Postiats/git/doc/PROJECT/SMALL/UTFPL/parsing/TEST/test01.dats\
: 119(line=11, offs=1) -- 171(line=12, offs=38)\
" // end of [val]
//
val
ret =
$PCRE.regexp_match_string
(": [0-9]+\\(line=[0-9]+, offs=[0-9]+\\) -- [0-9]+\\(line=[0-9]+, offs=[0-9]+\\)$", locstr)
val () =
println! ("ret = ", ret)
//
var ret: int
var mbeg: int and mend: int
val res =
$PCRE.regexp_match3_string
(": ([0-9]+)\\(line=([0-9]+), offs=([0-9]+)\\) -- ([0-9]+)\\(line=([0-9]+), offs=([0-9]+)\\)$", locstr, mbeg, mend, ret)
//
val () =
println!("ret = ", ret)
//
val-~
lcons(ntot0, res) = res
val-~
lcons(line0, res) = res
val-~
lcons(offs0, res) = res
val-~
lcons(ntot1, res) = res
val-~
lcons(line1, res) = res
val-~
lcons(offs1, res) = res
val-~lnil ((*void*)) = res
//
val () =
println!("ntot0 = ", ntot0)
val () =
println!("line0 = ", line0)
val () =
println!("offs0 = ", offs0)
val () =
println!("ntot1 = ", ntot1)
val () =
println!("line1 = ", line1)
val () =
println!("offs1 = ", offs1)
//
val () = stropt0_vt_free (ntot0)
val () = stropt0_vt_free (line0)
val () = stropt0_vt_free (offs0)
val () = stropt0_vt_free (ntot1)
val () = stropt0_vt_free (line1)
val () = stropt0_vt_free (offs1)
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test04.dats] *)
