(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

#staload
"libats/libc/SATS/search.sats"
#staload _ =
"libats/libc/DATS/search.dats"

(* ****** ****** *)

val cs =
"dacbzxyeffghhjkilmaabcdewwvutsrropq"
val cs =
(
string0_map(cs)
) where
{
impltmp
string0_map$fopr<>(c0) = c0
}

(* ****** ****** *)

val n0 = length(cs)
val
[
n0:int
]
n0 = $UN.cast{Nat}(n0)
vtypedef cs = array(char,n0)
val
(pf0,fpf|p0) =
$UN.ptr0_vtake{cs}(ptrof(cs))
val () =
array_quicksort_libc<char>
( !p0
, i2sz(n0)
, lam(x, y) => g0cmp(x, y) )

var k0 = ('z':char)
val () = println!("p0 = ", p0)
val cp =
lfind_libc<char>(k0, !p0, i2sz(n0), lam(x, y) => g0cmp(x, y))

local
prval () = fpf(pf0)
in
  val () = println!("cs = ", cs)
  val () = println!("cp = ", cptr2ptr(cp))
end

(* ****** ****** *)
//
val
inez =
hcreate(i2sz(1024*1024))
//
val () = assertloc(inez != 0)
//
(* ****** ****** *)

typedef word = string

(* ****** ****** *)

val-
~some_vt(words) =
FILEref_open_opt
("/usr/share/dict/words", "r")
//
val
words =
FILEref_streamize_word(words)
//
val () =
(
stream_vt_foreach0<word>(words)
) where
{
impltmp
stream_vt_foreach0$work<word>(w0) =
ignoret
(hsearch_enter<ptr>(w0, ptr0_null()))
}
//
(* ****** ****** *)

val cp =
hsearch_find("red")
val () =
println!("red: cp = ", cptr2ptr(cp))
val cp =
hsearch_find("blue")
val () =
println!("blue: cp = ", cptr2ptr(cp))

val cp =
hsearch_find("foobar")
val () =
println!("foobar: cp = ", cptr2ptr(cp))

val cp =
hsearch_find("squash")
val () =
println!("squash: cp = ", cptr2ptr(cp))
val cp =
hsearch_find("zucchini")
val () =
println!("zucchini: cp = ", cptr2ptr(cp))

(* ****** ****** *)

(* end of [test18.dats] *)
