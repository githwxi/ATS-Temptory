(* ****** ****** *)
//
// HX-2019-05-29:
// For ATS-Temptory
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

fn
rtfind
(
f: int -> int
): stream_vt(int) =
(
stream_vt_filter
(sint_streamize_gte(0))
) where
{
  impltmp
  stream_vt_filter$test<int>(n) = (f(n) = 0)
}

(* ****** ****** *)

val rs =
rtfind
(
lam(x) =>
(x - 10) * (x - 11) * (x - 12)
)
val () =
(
ignoret(stream_vt_iforall0(rs))
) where
{
impltmp
stream_vt_iforall0$test<int>(i, r) =
(
  i < 2
) where
{
  val () =
  println!("root#", (i+1), ": ", r)
}
} (* end of [val] *)

(* ****** ****** *)

val () =
(
gseq_foreach<SINT2><sint>(SINT2)
) where
{
impltmp
SINT2_range$beg<>() = 0
impltmp
SINT2_range$end<>() = 10
impltmp
gseq_foreach$work<sint>(i0) = println!("i0 = ", i0)
}
val () =
println!("------")
val () =
(
gseq_rforeach<SINT2><sint>(SINT2)
) where
{
impltmp
SINT2_range$beg<>() = 0
impltmp
SINT2_range$end<>() = 10
impltmp
gseq_rforeach$work<sint>(i0) = println!("i0 = ", i0)
}

(* ****** ****** *)

(* end of [test26.dats] *)
