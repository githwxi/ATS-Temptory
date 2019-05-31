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
//
val () =
(
try
println!
( "TheHead = "
, list0_head_exn(nil{int}()))
with ~ListSubscriptExn() => println!("Headless!")
)
//
(* ****** ****** *)
//
val () =
(
try
println!
( "TheHead = "
, list0_head_exn<int>(sing(123456789)))
with ~ListSubscriptExn() => println!("Headless!")
)
//
(* ****** ****** *)
//
val xs =
sint_listize(10)
val ys =
sint_rlistize(10)
//
val xs = list0_vt2t(xs)
and ys = list0_vt2t(ys)
//
val () = println! ("xs = ", xs)
val () = println! ("ys = ", ys)
//
(* ****** ****** *)
//
val () =
println!
("list0_get_at(xs,4) = ", get_at(xs, 4))
val () =
println!
("list0_get_at(ys,4) = ", get_at(ys, 4))
//
(* ****** ****** *)
//
val xs2 =
(
mapopt<x0><y0>(xs)
) where
{
typedef x0 = sint
typedef y0 = sint
impltmp
list0_mapopt$test<x0>
(x0) = (x0 >= 2 andalso x0 < 7)
impltmp
list0_mapopt$fopr<x0><y0>(x0) = (x0)
}
//
val ys2 =
(
mapopt_rlist<x0><y0>(ys)
) where
{
typedef x0 = sint
typedef y0 = sint
impltmp
list0_mapopt$test<x0>
(x0) = (x0 >= 2 andalso x0 < 7)
impltmp
list0_mapopt$fopr<x0><y0>(x0) = (x0)
}
//
val ((*void*)) = println!("xs2 = ", xs2)
val ((*void*)) = println!("ys2 = ", ys2)
//
(* ****** ****** *)

(* end of [test10.dats] *)
