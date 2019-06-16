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

fun
tally
(
cs: string
) : int =
(
  loop(cptrof(cs), 0)
) where
{
//
val rexp = "(-?[0-9]+)"
//
fun
loop
(
cp: cptr(char), sum: int
) : int = let
  var mbeg: int
  and mend: int
  var err0: int
  val res0 =
  $PCRE.regexp_match3_string
  (rexp, $UN.cast{String0}(cp), mbeg, mend, err0)
in
//
case+ res0 of
|
~list0_vt_nil() => sum
|
~list0_vt_cons(x0, xs) =>
 let
   val-~
   list0_vt_nil() = xs
   val () =
   assertloc(isneqz(x0))
   val cs =
   $UN.stropt0_vt_unsome(x0)
   val i0 =
   $extfcall(int, "atoi", $UN.castvwtp1{string}(cs))
   val () = string0_vt_free(cs)
 in
   let val mend = $UN.cast{uint}(mend) in loop(cp+mend, sum + i0) end
 end // end of [loop]
//
end // end of [loop]
//
} (* end of [tally] *)

(* ****** ****** *)

implfun
main0() = () where
{
//
val subject0 = "-1,2,-3,4,-5,6,-7,8,-9,10"
//
val () = println! ("tally(", subject0, ") = ", tally(subject0))
//
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test05.dats] *)
