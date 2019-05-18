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

#staload
"libats/libc/SATS/search.sats"
#staload _ =
"libats/libc/DATS/search.dats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

#infix <=>

(* ****** ****** *)

val cs =
"dacbzxyeffghhjkilmaabcdewwvutsrropq"
val cs =
(
string0_map(cs)
) where
{
implement
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


(* ****** ****** *)

(* end of [test18.dats] *)
