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

abstbox board = ptr

(* ****** ****** *)

extern
fun
board_nil(): board
extern
fun
board_cons
(x0: int,xs: board): board

(* ****** ****** *)

local
absimpl board = list0(int)
in
implement
board_nil
() = nil()
implement
board_cons
(x0, xs) = cons(x0, xs)
implement
gseq_forall<board><int>
(xs) =
(
  list0_forall<int>(xs)
) where
{
implement
list0_forall$test<int>(x0) = gseq_forall$test<int>(x0)
}
end // end of [local]

(* ****** ****** *)

fun
board_check
(xs: board, x0: int): bool =
(
gseq_iforall<board><int>(xs)
) where
{
implement
gseq_iforall$test<int>(i0, x1) =
  if (x0 != x1) then (i0+1 != abs(x0-x1)) else false
}

(* ****** ****** *)

fun
board_print
(xs: board): void =
(
gseq_rforeach<board><int>
  (xs)
) where
{
implement
gseq_rforeach$work<int>(x0) =
(
  sint_foreach<>(N); println!()
) where
{
  implement
  sint_foreach$work<>(i0) =
  (if i0 = x0 then print"Q " else print". ")
}
}

#symload print with board_print

(* ****** ****** *)

implement
gtree_node_children<board>
  (xs) =
(
list0_vt2t
(
gseq_mapopt_list<int><int><board>(N)
)
) where
{
implement
gseq_mapopt$test<int>(x0) = board_check(xs, x0)
implement
gseq_mapopt$fopr<int><board>(x0) = board_cons(x0, xs)
} (* end of [gtree_node_children] *)

(* ****** ****** *)

val
the_solutions =
gtree_streamize_dfs<board>(board_nil())
val
the_solutions =
(
stream_vt_filter<board>(the_solutions)
) where
{
implement
stream_vt_filter$test<board>(xs) = (gseq_length<board><int>(xs) >= N)
}

val () =
stream_vt_iforeach0
(
  the_solutions
) where
{
implement
stream_vt_iforeach0$work<board>(i0, xs) = println!("Solution#", i0+1, ":\n", xs)
}

(* ****** ****** *)

implement main0() = ()

(* ****** ****** *)

(* end of [test01.dats] *)
