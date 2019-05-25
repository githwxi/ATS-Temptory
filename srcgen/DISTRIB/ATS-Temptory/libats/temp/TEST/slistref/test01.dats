(* ****** ****** *)
/*
HX: for testing [slistref]
*/
(* ****** ****** *)

implement main1() = 0

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

local

#staload
"./../../SATS/slistref.sats"
#staload _ =
"./../../DATS/slistref.dats"

in(* in-of-local *)
//
typedef x0 = int
//
var
stk = slistref_nil{x0}()
val () = assertloc(iseqz(stk))
val () = println!("stk = ", stk)
//
val () = insert(stk, 0)
val () = insert(stk, 1)
val () = insert(stk, 2)
val () = insert(stk, 3)
val () = println!("stk = ", stk)
//
val-tt = 3 = takeout(stk)
val-ff = 2 = takeout(stk)
val () = println!("stk = ", stk)
//
//
end // end of [local]

(* ****** ****** *)

(* end of [test01.dats] *)
