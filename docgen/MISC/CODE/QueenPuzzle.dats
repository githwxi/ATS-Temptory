(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)

(*
How to test:
./QueenPuzzle
How to compile:
tempacc -D_GNU_SOURCE -DATS_MEMALLOC_LIBC QueenPuzzle.dats  -o QueenPuzzle
*)

(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

#define N 8

(* ****** ****** *)

abstbox board = ptr

(* ****** ****** *)

extern
fun
board_nil(): board
and
board_cons(int, board): board

(* ****** ****** *)

local

absimpl board = list0(int)

in(* in-of-local *)

implement
board_nil() = nil()
implement
board_cons(x0, xs) = cons(x0, xs)

implement
gseq_streamize<board><int>(xs) = list0_streamize<int>(xs)

end (* end of [local] *)

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
  loop(0)
) where
{
fun
loop(i0: int): void =
if
i0 >= N
then
println!((*void*))
else
(
if i0 = x0 then print "Q " else print ". "; loop(i0+1)
)
}
} (* end of [board_print *)

(* ****** ****** *)

fun
board_check
(x0: int, xs: board): bool =
(
gseq_iforall<board><int>(xs)
) where
{
implement
gseq_iforall$test<int>(i1, x1) =
if (x0 != x1) then (abs(x0 - x1) != i1 + 1) else false
}

(* ****** ****** *)

fun
board_extend
(xs: board): list(board) =
(
list0_vt2t
(
gseq_mapopt_list<sint><sint><board>(N)
)
) where
{
implement
gseq_mapopt$test<sint>(x0) = board_check(x0, xs)
implement
gseq_mapopt$fopr<sint><board>(x0) = board_cons(x0, xs)
}

fun
boardlst_extend
(xss: list(board)): list(board) =
(
list0_foldright<board><r0>(xss, list0_nil())
) where
{
typedef xs = board
typedef r0 = list(board)
implement
list0_foldright$fopr<xs><r0>(xs, r0) = append(board_extend(xs), r0)
}

(* ****** ****** *)

fun
qsolve(): list(board) =
(
  loop(0, sing(board_nil()))
) where
{
  fun
  loop
  (i0: int, xss: list(board)): list(board) =
  if i0 < N then loop(i0+1, boardlst_extend(xss)) else xss
}

(* ****** ****** *)

implement
main0() = () where
{
//
val
xss = qsolve()
//
val () =
(
gseq_iforeach<list(board)><board>(xss)
) where
{
implement
gseq_iforeach$work<board>(i, xs) =
(println!("Solution#", i+1, ":"); board_print(xs); println!())
}
}

(* ****** ****** *)

(* end of [QueenPuzzle.dats] *)

