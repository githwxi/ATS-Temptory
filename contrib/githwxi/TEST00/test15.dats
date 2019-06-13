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
implfun main0() =
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
val () = print!("A0 = ")
val () = 
(
glseq_print<glseq><arrszref(int),int>(A0)
) where
{
impltmp
{pf}{xs,x0}
glseq_foreach1(xs) =
(
glseq_rforeach1<pf><xs,x0>(xs)
) where
{
impltmp
glseq_rforeach1$work<pf><xs,x0>(x0) = glseq_foreach1$work<pf><xs,x0>(x0)
}
}
val () = println!((*void*))
//
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [test15.dats] *)
