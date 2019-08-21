(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

implfun main1() = 0

(* ****** ****** *)

#staload "libats/SATS/gord.sats"
#staload "libats/SATS/gnum.sats"
#staload "libats/SATS/gseq.sats"

(* ****** ****** *)

#staload _ = "libats/DATS/gord.dats"
#staload _ = "libats/DATS/gnum.dats"
#staload _ = "libats/DATS/gseq.dats"
#staload _ = "./DATS/gseq_sint.dats"
#staload _ = "libats/DATS/gseq_list0.dats"

(* ****** ****** *)

fun
fact(x: int) =
(
gseq_mul<gseq><list(int),int>
(
list0_vt2t(gseq_map_list<gseq><int,int><int>(x))
)
) where
{
  impltmp
  gseq_map$fopr<gseq><int,int><int>(x) = x + 1
}

(* ****** ****** *)

val () = println!("fact(10) = ", fact(10))

(* ****** ****** *)
//
fun
{a:tflt}
g_fact(x: a): a = (fact(x)) where
{
  fun
  fact(x: a): a =
    if g_ltez(x)
    then g_1<a>()
    else g_mul<a>(x, fact(g_pred<a>(x)))
} (* end of [g_fact] *)
//
(* ****** ****** *)

val () = println!("g_fact(10) = ", g_fact<int>(10))

(* ****** ****** *)

(* end of [test02.dats] *)
