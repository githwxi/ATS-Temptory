(* ****** ****** *)
//
// HX-2019-05-07:
// For ATS-Temptory
//
(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_cs320.hats"

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)
//
fun
{a:tflt}
length(xs: list0(a)): uint =
(
  loop(xs, 0u)
) where
{
fun
loop
(xs: list0(a), i0: uint): uint =
case+ xs of
| list0_nil() => i0
| list0_cons(_, xs) => loop(xs, succ(i0))
} (* end of [length] *)
//
(* ****** ****** *)
//
val xs =
g0ofg1($list1{int}(0, 1, 2))
val ys =
g0ofg1($list1{int}(3, 4, 5))
//
val () = println!("xs = ", xs)
//
local
implement
list0_print$beg<>() = print"["
implement
list0_print$end<>() = print"]"
implement
list0_print$sep<>() = print";"
in(*in-of-local*)
val () = println!("ys = ", ys)
end // end of [local]
//
val () =
println!("(xs, ys) = ", @(xs, ys))
//
val () =
println!
("length(xs) = ", length(xs))
val () =
println!
("length(ys) = ", length(ys))
//
val xsys =
g0ofg1($list1{list0(int)}(xs, ys))
val () =
println!
("length(xsys) = ", length(xsys))
val () = println!("xsys = ", xsys)
//
(* ****** ****** *)

(* end of [test03.dats] *)
