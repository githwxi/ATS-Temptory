(* ****** ****** *)
//
// HX-2019-05-12:
// For ATS-Temptory:
// A memory-clean example
//
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_cs320.hats"
//
(* ****** ****** *)

#define N 8

(* ****** ****** *)

absvtbox board = ptr

(* ****** ****** *)
//
extern
fun
board_free(board): void
extern
fun
board_copy(!board): board
//
(* ****** ****** *)

extern
fun{}
board_forall1(!board): bool
extern
fun{}
board_forall1$test(int): bool

extern
fun
board_nil(): board
extern
fun
board_cons1(int, !board): board

(* ****** ****** *)

implement
gfree$val<board>(xs) = board_free(xs)

(* ****** ****** *)

local

absimpl
board = list_rc(int)

in(*in-of-local*)

implement
board_nil() =
refcnt(nil_rc())
implement
board_cons1(x0, xs) =
let
val xs = board_copy(xs) in refcnt(cons_rc(x0, xs))
end

implement
board_free(xs) = decref(xs)
implement
board_copy(xs) = incref(xs)

implement
{}//tmp
board_forall1(xs) =
(
list0_rc_forall1<int>(xs)
) where
{
implement
list0_rc_forall1$test<int>(x0) = board_forall1$test<>(x0)
}

end // end of [local]
//
(* ****** ****** *)

implement
glseq_forall1<board><int>
  (xs) =
(
  board_forall1<>(xs)
) where
{
  implement
  board_forall1$test<>(x0) = glseq_forall1$test<int>(x0)
}

(* ****** ****** *)

fun
board_print0
(xs: board): void =
(
let
val () =
board_print1(xs) in board_free(xs)
end
)
and
board_print1
(xs: !board): void =
(
glseq_rforeach1<board><int>
  (xs)
) where
{
implement
glseq_rforeach1$work<int>(x0) =
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
board_check1
(x0: int, xs: !board): bool =
(
glseq_iforall1<board><int>(xs)
) where
{
implement
glseq_iforall1$test<int>(i1, x1) =
if
(x0 != x1)
then (abs(x0 - x1) != i1 + 1) else false
} (* end of [board_check1] *)

(* ****** ****** *)
//
fun
board_extend
(xs: board): list_vt(board) =
(
let
val bds = extend(xs, 0) in board_free(xs); bds
end
) where
{
fun
extend
(xs: !board, x0: int): list_vt(board) =
if x0 < N then
(
if
board_check1(x0, xs)
then
cons_vt(board_cons1(x0, xs), extend(xs, x0+1))
else extend(xs, x0+1)
)
else nil_vt((*void*))
}

fun
boardlst_extend
(xss: list_vt(board)): list_vt(board) =
(
case+ xss of
|
~nil_vt() => nil_vt()
|
~cons_vt(xs, xss) =>
 (append(board_extend(xs), boardlst_extend(xss)))
)

(* ****** ****** *)

fun
qsolve(): list_vt(board) =
(
  loop(0, sing_vt(board_nil()))
) where
{
  fun
  loop
  (i0: int, xss: list_vt(board)): list_vt(board) =
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
glseq_iforeach0<list_vt(board)><board>(xss)
) where
{
implement
glseq_iforeach0$work<board>(i, xs) =
(println!("Solution#", i+1, ":"); board_print0(xs); println!())
}
} (* end of [main0] *)

(* ****** ****** *)

(* end of [test09.dats] *)
