(* ****** ****** *)
(*
HX:
For
testing gtree_streamize_dfs
*)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

#staload _ =
"libats/temp/DATS/slistref.dats"

(* ****** ****** *)

#staload "./../SATS/gtree.sats"
#staload "./../DATS/gtree.dats"

(* ****** ****** *)

#define N 8

(* ****** ****** *)

absvtbox board = ptr

(* ****** ****** *)

extern
fun
board_nil(): board
extern
fun
board_cons1
(x0: int, xs: !board): board

(* ****** ****** *)
//
extern
fun
board_free(board): void
impltmp
gfree$val<board>(xs) = board_free(xs)
//
(* ****** ****** *)

local
absimpl
board = list0_vt(int)
in
implfun
board_nil
() = lnil()
implfun
board_cons1
(x0, xs) =
lcons(x0, copy(xs))

implfun
board_free(xs) = list0_vt_free(xs)

impltmp
glseq_forall1<glseq><board,int>
(xs) =
(
  list0_vt_forall1<int>(xs)
) where
{
impltmp
list0_vt_forall1$test<int>(x0) =
glseq_forall1$test<glseq><board,int>(x0)
}
//
impltmp
glseq_rlistize<glseq><board,int>(xs) = list0_vt_reverse(xs)
//
end // end of [local]

(* ****** ****** *)

fun
board_check
(xs: !board, x0: int): bool =
(
glseq_iforall1<glseq><board,int>(xs)
) where
{
impltmp
glseq_iforall1$test<glseq><board,int>(i0, x1) =
  if (x0 != x1) then (i0+1 != abs(x0-x1)) else false
}

(* ****** ****** *)

fun
board_print0
(xs: board): void =
(
glseq_rforeach0<glseq><board,int>
  (xs)
) where
{
impltmp
glseq_rforeach0$work<glseq><board,int>(x0) =
(
  sint0_foreach<>(N); println!()
) where
{
  impltmp
  sint0_foreach$work<>(i0) =
  (if i0 = x0 then print"Q " else print". ")
}
}

#symload print0 with board_print0

(* ****** ****** *)

impltmp
gtree_node_children<board>
  (xs) =
(
  loop(0, xs)
) where
{
fun
loop
( x0: int
, xs: !board
) : list0_vt(board) =
if
(x0 >= N)
then list0_vt_nil()
else
(
if
board_check(xs, x0)
then lcons(board_cons1(x0, xs), loop(x0+1, xs)) else loop(x0+1, xs)
)
} (* end of [gtree_node_children] *)

(* ****** ****** *)

val
the_solutions =
(
stream_vt_filter<board>(xss)
) where
{
//
val
xss =
gtree_streamize_dfs<board>(board_nil())
//
impltmp
stream_vt_filter$test<board>(xs) = (glseq_length<glseq><board,int>(xs) >= N)
//
}

(* ****** ****** *)

val () =
~(the_solutions)

(* ****** ****** *)

(*
val () =
stream_vt_iforeach0
(
  the_solutions
) where
{
impltmp
stream_vt_iforeach0$work<board>(i0, xs) =
(print!("Solution#", i0+1, ":\n"); print0(xs); println!())
}
*)

(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

(* end of [test01.dats] *)
