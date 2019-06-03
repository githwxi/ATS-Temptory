(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
(* ****** ****** *)

(*
How to test:
./QueenPuzzle_vt
How to compile:
mytempacc QueenPuzzle_vt.dats -o QueenPuzzle_vt
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

absvtbox board = ptr
vtypedef boardlst = list_vt(board)

(* ****** ****** *)

extern
fun
board_nil(): board
and
board_free(board): void
and
board_cons1(int, !board): board

(* ****** ****** *)

local

absimpl
board = list0_vt(int)

in(* in-of-local *)

implfun
board_nil() = nil_vt()
implfun
board_cons1(x0, xs) =
let
val
xs = copy(xs) in list0_vt_cons(x0, xs)
end

implfun
board_free(xs) =
list0_vt_free<int>(xs)

impltmp
glseq_listize<board><int>
  (xs) = (xs)
impltmp
glseq_forall1<board><int>
  (xs) =
(
  list0_vt_forall1<int>(xs)
) where
{
impltmp
list0_vt_forall1$test<int>
  (x0) =
(
  glseq_forall1$test<int>(x0)
)
}
impltmp
glseq_rlistize<board><int>(xs) = list0_vt_reverse(xs)

end (* end of [local] *)

(* ****** ****** *)

impltmp
gfree$val<board>(xs) = board_free(xs)

(* ****** ****** *)

fun
board_check1
(xs: !board, x0: int): bool =
(
glseq_iforall1<board><int>(xs)
) where
{
impltmp
glseq_iforall1$test<int>
  (i1, x1) =
(
  (x0 != x1)
  &&
  (abs(x0 - x1) != i1 + 1)
)
} (* end of [board_check1] *)

(* ****** ****** *)

fun
board_extend0
(xs: board): boardlst =
let
fun
loop(i0: int, xs: !board): boardlst =
if
(i0 < N)
then
(
if
board_check1(xs, i0)
then
let
val
xs1 =
board_cons1(i0, xs) in cons_vt(xs1, loop(i0+1, xs))
end
else loop(i0+1, xs)
) else list0_vt_nil()
in
  let val res = loop(0, xs) in board_free(xs); res end
end

fun
boardlst_extend0
(xss: boardlst): boardlst =
(
list0_vt_foldright0<board><r0>(xss, list0_vt_nil())
) where
{
vtypedef xs = board
vtypedef r0 = boardlst
impltmp
list0_vt_foldright0$fopr<xs><r0>(xs, r0) = append(board_extend0(xs), r0)
}

(* ****** ****** *)

fun
board_print0
(xs: board): void =
(
glseq_rforeach0<board><int>
  (xs)
) where
{
impltmp
glseq_rforeach0$work<int>(x0) =
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
} (* end of [board_print0 *)

(* ****** ****** *)

fun
qsolve(): boardlst =
(
  loop(0, sing_vt(board_nil()))
) where
{
  fun
  loop
  (i0: int, xss: boardlst): boardlst =
  if i0 < N then loop(i0+1, boardlst_extend0(xss)) else xss
}

(* ****** ****** *)

implfun
main0() = () where
{
//
val
xss = qsolve()
//
val () =
(
glseq_iforeach0<boardlst><board>(xss)
) where
{
impltmp
glseq_iforeach0$work<board>(i, xs) =
(println!("Solution#", i+1, ":"); board_print0(xs); println!())
}
}

(* ****** ****** *)

(* end of [QueenPuzzle_vt.dats] *)
