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
implfun
board_nil
() = nil()
implfun
board_cons
(x0, xs) = cons(x0, xs)
impltmp
gseq_forall<gseq><board,int>
(xs) =
(
  list0_forall<int>(xs)
) where
{
impltmp
list0_forall$test<int>(x0) = gseq_forall$test<gseq><board,int>(x0)
}
end // end of [local]

(* ****** ****** *)

fun
board_check
(xs: board, x0: int): bool =
(
gseq_iforall<gseq><board,int>(xs)
) where
{
impltmp
gseq_iforall$test<gseq><board,int>(i0, x1) =
  if (x0 != x1) then (i0+1 != abs(x0-x1)) else false
}

(* ****** ****** *)

fun
board_print
(xs: board): void =
(
gseq_rforeach<gseq><board,int>
  (xs)
) where
{
impltmp
gseq_rforeach$work<gseq><board,int>(x0) =
(
  sint0_foreach<>(N); println!()
) where
{
  impltmp
  sint0_foreach$work<>(i0) =
  (if i0 = x0 then print"Q " else print". ")
}
}

#symload print with board_print

(* ****** ****** *)

impltmp
gtree_node_children<board>
  (xs) =
(
list0_vt2t
(
gseq_mapopt_list<gseq><int,int><board>(N)
)
) where
{
impltmp
gseq_mapopt$test<gseq><int,int>(x0) = board_check(xs, x0)
impltmp
gseq_mapopt$fopr<gseq><int,int><board>(x0) = board_cons(x0, xs)
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
impltmp
stream_vt_filter$test<board>(xs) = (gseq_length<gseq><board,int>(xs) >= N)
}

val () =
stream_vt_iforeach0
(
  the_solutions
) where
{
impltmp
stream_vt_iforeach0$work<board>(i0, xs) = println!("Solution#", i0+1, ":\n", xs)
}

(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)

(* end of [test01.dats] *)
