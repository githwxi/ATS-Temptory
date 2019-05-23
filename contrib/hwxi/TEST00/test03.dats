(* ****** ****** *)
//
// HX-2019-05-07:
// For ATS-Temptory
//
(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

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
val zs =
g0ofg1($list1{int}(6, 7, 8))
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
println!
("(xs,ys) = ", @(xs, ys))
//
val () =
println!
("length(xs) = ", length(xs))
val () =
println!
("length(ys) = ", length(ys))
//
val
xyzs =
g0ofg1
($list1{list0(int)}(xs, ys, zs))
//
val () = println!("xyzs = ", xyzs)
val () =
println!("length(xyzs) = ", length(xyzs))
//
(* ****** ****** *)

(* end of [test03.dats] *)
