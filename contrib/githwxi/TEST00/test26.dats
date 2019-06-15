(* ****** ****** *)
//
// HX-2019-06-01:
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
(sint0_streamize_gte(0))
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
gseq_foreach<
gseq><SINT2,sint>(SINT2)
) where
{
impltmp
SINT2_range$beg<>() = 0
impltmp
SINT2_range$end<>() = 10
impltmp
gseq_foreach$work<
gseq><SINT2,sint>(i0) = println!("i0 = ", i0)
}
val () =
println!("------")
val () =
(
gseq_rforeach<
gseq><SINT2,sint>(SINT2)
) where
{
impltmp
SINT2_range$beg<>() = 0
impltmp
SINT2_range$end<>() = 10
impltmp
gseq_rforeach$work<
gseq><SINT2,sint>(i0) = println!("i0 = ", i0)
}

(* ****** ****** *)

val () =
(
ftest()
) where
{
fun
ftest(): void =
{
val
alphabet =
"ABCDEFGHIJKLMNOPQRSTUVWXYZ"
val p0 =
cptrof(alphabet)
val p1 =
p0 + length(alphabet)
//
val () =
(
gseq_foreach<
gseq><CPTR2(char),char>(CPTR2); println!()
) where
{
//
impltmp
CPTR2_range$beg<char>() = p0
impltmp
CPTR2_range$end<char>() = p1
impltmp
gseq_foreach$work<
gseq><CPTR2(char),char>(c0) = print!(c0)
//
} (* end of [where] *)
//
val () =
(
gseq_rforeach<
gseq><CPTR2(char),cptr(char)>(CPTR2); println!()
)  where
{
//
impltmp
CPTR2_range$beg<char>() = p0
impltmp
CPTR2_range$end<char>() = p1
impltmp
gseq_rforeach$work<
gseq><CPTR2(char),cptr(char)>(cp) = print!($UN.cptr0_get(cp))
//
} (* end of [where] *)
} (* end of [test] *)
} (* end of [where] *)

(* ****** ****** *)

(* end of [test26.dats] *)
