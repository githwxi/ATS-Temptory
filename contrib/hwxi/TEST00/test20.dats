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

implement main0() = ()

(* ****** ****** *)

vtypedef xs = list0_vt(int)

(* ****** ****** *)

local
val A0 =
arrszref_make_elt<ptr>
(i2sz(10), ptr0_null())
in
val A0 = $UN.cast{arrszref(xs)}(A0)
end // end of [local]

(* ****** ****** *)

val xs0 = nil_vt{int}()
val xs1 = cons_vt(0, gcopy$val<xs>(xs0))
val xs2 = cons_vt(0, gcopy$val<xs>(xs1))
val xs3 = cons_vt(0, gcopy$val<xs>(xs2))

(* ****** ****** *)

val ( ) = A0[1] := xs1
val ( ) = A0[2] := xs2
val ( ) = A0[3] := xs3
val ( ) = A0[1] := nil_vt()
val ( ) = A0[2] := nil_vt()
val ( ) = A0[3] := nil_vt()

(* ****** ****** *)

(* end of [test19.dats] *)
