(* ****** ****** *)

(*
Author: HX-2019-06-01
*)

(* ****** ****** *)

(*
How to compile:
tempacc -O2 -DATS_MEMALLOC_LIBC -o Game-of-24_dats Game-of-24.dats 
How to test it: ./Game-of-24_dats 
*)

(* ****** ****** *)

#include
"share/HATS\
/temptory_staload_bucs320.hats"

(* ****** ****** *)

implfun main0() = ()

(* ****** ****** *)
//
datatype expr =
| Int of int
| Add of (expr, expr)
| Sub of (expr, expr)
| Mul of (expr, expr)
| Div of (expr, expr)
//
typedef exprs = list0(expr)
//
(* ****** ****** *)

extern
fun
print_expr(expr): void
#symload print with print_expr 

(* ****** ****** *)

implfun
print_expr(e0) =
(
case+ e0 of
| Int(x0) => print!(x0)
| Add(e1, e2) => print!("(", e1, "+", e2, ")")
| Sub(e1, e2) => print!("(", e1, "-", e2, ")")
| Mul(e1, e2) => print!("(", e1, "*", e2, ")")
| Div(e1, e2) => print!("(", e1, "/", e2, ")")
) (* end of [print_expr] *)

impltmp
print$val<expr>(e) = print_expr(e)

(* ****** ****** *)

extern
fun
expr_eval(e0: expr): double
#symload eval with expr_eval

implfun
expr_eval(e0) =
(
case+ e0 of
| Int(x0) => i2f(x0)
| Add(e1, e2) =>
  eval(e1) + eval(e2)
| Sub(e1, e2) =>
  eval(e1) - eval(e2)
| Mul(e1, e2) =>
  eval(e1) * eval(e2)
| Div(e1, e2) =>
  eval(e1) / eval(e2)
) where
{
  #macdef i2f(x) = cast2dbl(,(x))
}

(* ****** ****** *)

#define EPSILON 1E-6

(* ****** ****** *)

extern
fun
expr_iseqz
(e0: expr): bool
and
double_iseqz
(x0: double): bool
#symload iseqz with expr_iseqz
#symload iseqz with double_iseqz

implfun
expr_iseqz(e0) =
iseqz(expr_eval(e0))
implfun
double_iseqz(x0) =
(abs(x0) <= EPSILON)

(* ****** ****** *)

typedef node = list0(expr)

(* ****** ****** *)

fun
node_children
(NX0 : node): list0(node) =
  (NXS) where
{
//
typedef
xy = (exprs, exprs)
val xys =
(
tolist
(list0_nchoose_rest(NX0, 2))
)
//
val NXS =
(
list0_mapjoin<xy><node>(xys)
) where
{
impltmp
list0_mapjoin$fopr<xy><node>
  (xy) =
(
  list0_reverse(res)
) where
{
//
  val xs = xy.0 and ys = xy.1
  val e0 = xs[0] and e1 = xs[1]
//
  val res = nil(): list0(node)
  val res = cons(Add(e0, e1)::ys, res)
  val res = cons(Sub(e0, e1)::ys, res)
  val res = cons(Sub(e1, e0)::ys, res)
  val res = cons(Mul(e0, e1)::ys, res)
  val res =
  if
  iseqz(e1)
  then res else cons(Div(e0, e1)::ys, res)
  val res =
  if iseqz(e0)
  then res else cons(Div(e1, e0)::ys, res)
//
} (* end of [where] *)
} (* end of [where] *)
} (* end of [node_children] *)

(* ****** ****** *)

#staload GT =
"libats/temp\
/bucs320/SATS/gtree.sats"
#staload _(*GT*) =
"libats/temp\
/bucs320/DATS/gtree.dats"

(* ****** ****** *)

fun
Game_of_24
( n1: int
, n2: int
, n3: int
, n4: int): stream_vt(expr) =
let
//
val NX0 =
Int(n1)::Int(n2)::
Int(n3)::Int(n4)::nil{expr}()
//
val
NXS =
(
$GT.gtree_streamize_dfs<node>(NX0)
) where
{
impltmp
$GT.gtree_node_children<node>(NX0) = node_children(NX0)
}
in
(
stream_vt_mapopt<node><expr>(NXS)
) where
{
impltmp
stream_vt_mapopt$test<node>(nx) =
(
length(nx)=1 && iseqz(eval(nx[0])-24.0)
)
impltmp
stream_vt_mapopt$fopr<node><expr>(nx) = nx[0]
}
end (* end of [Game_of_24] *)

(* ****** ****** *)

val
sol =
listize
(Game_of_24(3, 3, 8, 8))
val ((*void*)) =
println!("Play(3, 3, 8, 8) = ", sol)
val
sol =
listize
(Game_of_24(3, 5, 7, 13))
val ((*void*)) =
println!("Play(3, 5, 7, 13) = ", sol)
val
sol =
listize
(Game_of_24(5, 7, 7, 11))
val ((*void*)) =
println!("Play(5, 7, 7, 11) = ", sol)
val
sol =
listize
(Game_of_24(10, 10, 4, 4))
val ((*void*)) =
println!("Play(10, 10, 4, 4) = ", sol)

(* ****** ****** *)

%{^
ATSdynexn_dec(temptory_056___ListSubscriptExn) ;
ATSdynexn_dec(temptory_056___ArraySubscriptExn) ;
%} (* %{^ *)

(* ****** ****** *)

(* end of [Game-of-24.dats] *)
