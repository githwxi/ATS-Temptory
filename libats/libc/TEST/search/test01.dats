/*
HX: for testing search
*/

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

implement main1() = 0

(* ****** ****** *)

#staload
"./../../SATS/search.sats"
#staload _ =
"./../../DATS/search.dats"

(* ****** ****** *)

val () =
assertloc
(hcreate(i2sz(1024)) != 0)

(* ****** ****** *)

val cp =
hsearch_find("0")
val () =
assertloc(iseqz(cp))

(* ****** ****** *)

val cp =
hsearch_enter("0", "0->a")
val cp =
hsearch_find("0")
val () =
assertloc(isneqz(cp))
val () = println!("cp.key = ", cp.key())
val () = println!("cp.data = ", cp.data())
val cp =
hsearch_enter("1", "1->b")
val cp =
hsearch_find("1")
val () =
assertloc(isneqz(cp))
val () = println!("cp.key = ", cp.key())
val () = println!("cp.data = ", cp.data())

(* ****** ****** *)

val () = hdestroy((*void*))

(* ****** ****** *)
//
val-
~some0_vt(ht) =
htabref_create(i2sz(1024))
//
val-
~none0_vt() = find(ht, "0")
val-
~none0_vt() = find(ht, "1")
val-
~none0_vt() = find(ht, "2")
//
val-
~some0_vt(cp) =
enter(ht, "0", "0 -> a")
val-
~some0_vt(cp) =
enter(ht, "1", "1 -> b")
//
val-
~some0_vt(cp) = find(ht, "1")
val () =
println!
("cp.data() = ", $UN.cast{string}(cp.data()))
val-
~some0_vt(cp) = find(ht, "0")
val () =
println!
("cp.data() = ", $UN.cast{string}(cp.data()))
//
val-~none0_vt() = find(ht, "2")
//
(* ****** ****** *)

val () = htabref_destroy(ht)

(* ****** ****** *)

(* end of [test01.dats] *)
