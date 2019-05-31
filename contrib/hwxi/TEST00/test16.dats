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

typedef word = string
typedef nword = (int, word)

(* ****** ****** *)
//
val
MobyDick = "DATA/2701-0.txt"
val-
~some_vt
(MobyDick) =
FILEref_open_opt(MobyDick, "r")
val
(MobyDick) =
FILEref_streamize_word(MobyDick)
val
(MobyDick) =
(
glseq_map0_list<
stream_vt(word)><word><word>(MobyDick)
) where
{
impltmp
glseq_map0$fopr<word><word>(x0) = tolower(x0)
}
val
(MobyDick) = mergesort(MobyDick)
//
(* ****** ****** *)

val nwordlst =
(
auxmain1(MobyDick)
) where
{
typedef x0 = word
typedef nx = nword
fun
auxmain1
(
xs: list0_vt(x0)
) : stream_vt(nx) =
$ldelay
(
case+ xs of
|
~list0_vt_nil() =>
 stream_vt_nil()
|
~list0_vt_cons(x0, xs) => auxmain2(x0, 1, xs)
, list0_vt_free<x0>(xs)
)
and
auxmain2
(
x0: x0, n0: int
,
xs: list0_vt(x0)
) : stream_vt_con(nx) =
(
case+ xs of
| ~list0_vt_nil() =>
   stream_vt_sing((n0, x0))
| ~list0_vt_cons(x1, xs) =>
   if x0 = x1
     then
     auxmain2(x0, n0+1, xs)
     else
     stream_vt_cons
     ((n0, x0), $ldelay(auxmain2(x1, 1, xs), free(xs)))
   // end of [if]
)
} (* end of [where] *)

(* ****** ****** *)

val
nwordlst =
stream_vt_listize(nwordlst)
val
nwordlst =
(
list0_vt_mergesort(nwordlst)
) where
{
impltmp
list0_vt_mergesort$cmp<nword>
  (nw1, nw2) =
let
  val n1 = nw1.0
  val n2 = nw2.0
in
  if (n1 > n2) then ~1 else (if n1 < n2 then 1 else strcmp(nw1.1, nw2.1))
end
} (* end of [where] *)

(* ****** ****** *)

val () =
(
list0_vt_iforeach0<nword>(nwordlst)
) where
{
impltmp
list0_vt_iforeach0$work<nword>(i0, nw) =
  if i0 < 250 then println!("word#", i0+1, ": ", nw.1, "(", nw.0, ")")
}

(* ****** ****** *)

(* end of [test16.dats] *)
