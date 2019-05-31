(* ****** ****** *)
(*
HX:
For testing divconq
*)
(* ****** ****** *)
//
#include
"share/HATS\
/temptory_staload_bucs320.hats"
//
(* ****** ****** *)

#staload "./../SATS/divconq.sats"
#staload "./../DATS/divconq.dats"

(* ****** ****** *)

#define N 8

(* ****** ****** *)

abstbox board = ptr

(* ****** ****** *)

typedef
boardlst = list0(board)

(* ****** ****** *)

extern
fun
board_nil(): board
extern
fun
board_cons
(x0: int, xs: board): board

(* ****** ****** *)

extern
fun
board_length(board): (int)
#symload length with board_length

(* ****** ****** *)

extern
fun
QueenPuzzle(): boardlst

(* ****** ****** *)

local
absimpl
board=list0(int)
in(*in-of-local*)
implfun
board_nil
() = nil()
implfun
board_cons
(x0, xs) = cons(x0, xs)
implfun
board_length
(xs) = list0_length(xs)
impltmp
gseq_forall<board><int>
(xs) =
(
  list0_forall<int>(xs)
) where
{
impltmp
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
impltmp
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
impltmp
gseq_rforeach$work<int>(x0) =
(
  loop(0); println!()
) where
{
  fun
  loop(i0: int): void =
  if
  (i0 < N)
  then
  (if i0 = x0 then print"Q " else print". "; loop(i0+1))
}
}

#symload print with board_print

(* ****** ****** *)

implfun
QueenPuzzle() =
(
solve(board_nil())
) where
{
//
typedef i = board
typedef o = boardlst
//
fun{}
solve(xs: i): o =
divconq_solve<i><o>(xs)
//
impltmp
divconq_divide<i><o>
  (xs) =
( loop(0) ) where
{
fun
loop
(i:int):boardlst =
if
(i < N)
then
(
if
board_check(xs, i)
then
board_cons(i, xs)::loop(i+1) else loop(i+1)
)
else list0_nil(*void*)
} (* end of [where] *)
//
impltmp
divconq_solve_rec<i><o>
  (xs) = solve(xs)
impltmp
divconq_solve_opt<i><o>
  (xs) =
(
  if
  length(xs) >= N
  then lsome(sing(xs)) else lnone()
)
//
impltmp
divconq_conquer_cmb<i><o>(rs) = concat(rs)
//
} (* end of [QueenPuzzle] *)

(* ****** ****** *)
//
implfun
main0() =
{
//
val xss = QueenPuzzle()
//
(*
val ((*void*)) = println!("|xss| = ", length(xss))
*)
//
val ((*void*)) =
(
list0_iforeach(xss)
) where
{
impltmp
list0_iforeach$work<board>(i0, xs) = println!("Solution#", i0+1, ":\n", xs)
}
//
} (* end of [main0] *)
//
(* ****** ****** *)

(* end of [test05.dats] *)
