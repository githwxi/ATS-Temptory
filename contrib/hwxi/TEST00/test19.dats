(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
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

val () = insert(xs, 0)
val () = insert(xs, 1)
val () = insert(xs, 2)
val-tt = (3 = qlist_length(xs))

(* ****** ****** *)

(* end of [test19.dats] *)
