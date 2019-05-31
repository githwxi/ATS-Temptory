(* ****** ****** *)
//
// HX-2019-05-09:
// For ATS-Temptory
//
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

extern
fun{}
board_forall(board): bool
extern
fun{}
board_forall$test(int): bool
extern
fun{}
board_rforall(board): bool
extern
fun{}
board_rforall$test(int): bool

extern
fun
board_nil(): board
extern
fun
board_cons(int, board): board

(* ****** ****** *)

local

absimpl board = list(int)

in(*in-of-local*)

implfun
board_nil() = nil()
implfun
board_cons(x0, xs) = cons(x0, xs)

impltmp
{}//tmp
board_forall(xs) =
(
list0_forall<int>(xs)
) where
{
impltmp
list0_forall$test<int>(x0) = board_forall$test<>(x0)
}

end // end of [local]

(* ****** ****** *)

impltmp
gseq_forall<board><int>
  (xs) =
(
  board_forall<>(xs)
) where
{
  impltmp
  board_forall$test<>(x0) = gseq_forall$test<int>(x0)
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
impltmp
gseq_rforeach$work<int>(x0) =
(
  loop(0)
) where
{
fun
loop(i0: int): void =
if
i0 < N
then
(
loop(i0+1)
) where
{
  val () =
  if
  i0 = x0
  then print "Q " else print". "
}
else println!()
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
impltmp
gseq_iforall$test<int>(i1, x1) =
if (x0 != x1) then (abs(x0 - x1) != i1 + 1) else false
}

(* ****** ****** *)

fun
board_extend
(xs: board): list(board) =
(
  extend(0)
) where
{
fun
extend
(x0: int)
:
list(board) =
if x0 < N then
(
if
board_check(x0, xs)
then board_cons(x0, xs) :: extend(x0+1) else extend(x0+1)
)
else list0_nil((*void*))
}

fun
boardlst_extend
(xss: list(board)): list(board) =
(
case+ xss of
| list0_nil() => list0_nil()
| list0_cons(xs, xss) => append(board_extend(xs), boardlst_extend(xss))
)

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

implfun
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
impltmp
gseq_iforeach$work<board>(i, xs) =
(println!("Solution#", i+1, ":"); board_print(xs); println!())
}
}

(* ****** ****** *)

(* end of [test04.dats] *)
