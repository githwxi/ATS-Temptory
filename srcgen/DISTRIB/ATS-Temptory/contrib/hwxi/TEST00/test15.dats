(* ****** ****** *)
//
// HX-2019-05-13:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)
//
implement main0() =
{
//
val xs =
sint_listize(10)
val A0 =
arrszref_make<int>(xs)
//
val () =
println!("A0 = ", A0)
//
val () =
print!("A0 = ")
val () = 
(
glseq_print<arrszref(int)><int>(A0)
) where
{
implement
{xs}{x0}
glseq_foreach1(xs) =
(
glseq_rforeach1<xs><x0>(xs)
) where
{
implement
glseq_rforeach1$work<x0>(x0) = glseq_foreach1$work<x0>(x0)
}
}
val () = println!((*void*))
//
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [test15.dats] *)
