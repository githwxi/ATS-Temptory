(* ****** ****** *)
//
// HX-2019-05-13:
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

datatype
mylist(a:tflt) =
| mylist_nil of ()
| mylist_cons of (a, mylist(a))

val xs = mylist_nil{int}()
val xs = mylist_cons(3, xs)
val xs = mylist_cons(2, xs)
val xs = mylist_cons(1, xs)

(* ****** ****** *)

extern
fun
{a:tflt}
mylist_forall
(xs: mylist(a)): bool
extern
fun
{a:tflt}
mylist_forall$test(x0: a): bool

(* ****** ****** *)

impltmp
(a:tflt)
gseq_forall<mylist(a)><a>(xs) =
(
mylist_forall<a>(xs)
) where
{
impltmp
mylist_forall$test<a>(x0) = gseq_forall$test<a>(x0)
}

(* ****** ****** *)

impltmp
{a}
mylist_forall(xs) =
(
  loop(xs)
) where
{
fun
loop(xs: mylist(a)): bool =
case+ xs of
| mylist_nil() => true
| mylist_cons(x0, xs) =>
  (
  if
  mylist_forall$test<a>(x0) then loop(xs) else false
  )
}

(* ****** ****** *)
//
val () =
(print!("xs = ")
;gseq_print<mylist(int)><int>(xs);println!((*void*)))
//
val () =
println!("length(xs) = ", gseq_length<mylist(int)><int>(xs))
//
(* ****** ****** *)

(* end of [test14.dats] *)
