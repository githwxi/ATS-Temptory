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

fun
intrep_eval
(rep: string): int =
(
(
(
string0_foldleft<int>(rep, 0)
) where
{
impltmp
string0_foldleft$fopr<int>
(r0, c0) = 10*r0 + (c0 - '0')
}
)
) (* end of [intrep_eval] *)

(* ****** ****** *)

fun
intrep_rprint
(rep: string): void =
(
gseq_rforeach<
gseq><string,char>(rep)
) where
{
impltmp
gseq_rforeach$work<
gseq><string,char>(c0) = print(c0)
} (* end of [intrep_rprint] *)

(* ****** ****** *)

val () =
println!("intrep_eval(12345) = ", intrep_eval("123456789"))
val () =
(print("intrep_rprint(12345) = "); intrep_rprint("123456789"); println!())

(* ****** ****** *)

(* end of [test11.dats] *)
