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

(* end of [test01.dats] *)
