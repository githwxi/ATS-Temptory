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

val xs = qlist_nil{int}()

(* ****** ****** *)

val t0 = takeout_opt(xs)
val () = assertloc(iseqz(t0))

(* ****** ****** *)

val () = println!("xs = ", xs)

(* ****** ****** *)

val () = insert(xs, 0)
val () = println!("xs = ", xs)
val () = insert(xs, 1)
val () = println!("xs = ", xs)
val () = insert(xs, 2)
val () = println!("xs = ", xs)

(* ****** ****** *)

val-tt = remove(xs)
val () = println!("xs = ", xs)
val-tt = remove(xs)
val () = println!("xs = ", xs)
val-tt = remove(xs)
val () = println!("xs = ", xs)

(* ****** ****** *)

(* end of [test19.dats] *)
