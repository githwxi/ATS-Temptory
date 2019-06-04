# Game-of-24

Given four integers n1, n2, n3 and n4, one chooses two and uses them
to produce a rational number r1 by applying either addition,
subtraction, multiplication or division; one mixes r1 with the
remaining two numbers and chooses two of them to produce a rational
number r2 by applying either addition, subtraction, multiplication or
division; one then takes r2 and the last remaining number to produce a
rational number r3 by applying addition, subtraction, multiplication,
or division; if there exists a way to make r3 equal 24, then (n1, n2,
n3, n4) is said to be a good quad. For instance, (10,10,4,4) is a good
quad since we have: (10*10-4)/4 = 24; (5,7,7,11) is a good quad since
we have: (5-11/7)*7 = 24. Game-of-24 is a game that determines whether
four given integers form a good quad or not. For a demo of
Game-of-24, please visit [here](https://ats-lang.github.io/DOCUMENT/ATS2FUNCRASH/LECTURE/07-10/CODE/Game-of-24.html).

Let us first declare a datatype `expr` for values representing arithmetic expressions:

```ats
datatype expr =
| Int of int
| Add of (expr, expr)
| Sub of (expr, expr)
| Mul of (expr, expr)
| Div of (expr, expr)

typedef exprs = list0(expr)
```

The following function `print_expr` is for printing expr-values:

```ats
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
```

Why is it needed to implement a specific template `print$val<expr>`?
It is needed because various generic templates for printing
make use of `print$val`. For instance, the template `list0_print<expr>`
can be called to print a list of expr-values as long as the template
`print$val<expr>` is available.

The following function `expr_eval` is for evaluating expr-values
(to a double, that is, a floating point number of double precision):

```ats
extern
fun
expr_eval(e0: expr): double
#symload eval with expr_eval

implfun
expr_eval(e0) =
(
case+ e0 of
| Int(x0) => cast2dbl(x0)
| Add(e1, e2) => eval(e1) + eval(e2)
| Sub(e1, e2) => eval(e1) - eval(e2)
| Mul(e1, e2) => eval(e1) * eval(e2)
| Div(e1, e2) => eval(e1) / eval(e2)
)
```
Note that
`cast2dbl` casts an int-value to a double.

Let us next introduce a function `expr_iseqz`
that tests if a given expr-value evaluates to zero:

```ats
#define EPSILON 1E-6 // 0.000001

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
expr_iseqz(e0) = iseqz(eval(e0))
implfun
double_iseqz(x0) = (abs(x0) <= EPSILON)
```

Note that `abs` refers to the absolute value function. Due to the
nature of floating point numbers, a double is considered to be equal
to zero if it is "small". It is completely empirical that EPSILON is
chosen to be 1 millionth in this example.

Game-of-24 is a typical problem of tree-based search. Assume that
a node consists of a list of expr-values:

```ats
typedef node = list0(expr)
```

If the list contains two or more values, we can choose two among them
and form a new value by applying an arithmetic operation to the two;
we then put this new value back to form a new node (containing one
fewer value than the original node); this new node is considered a
child of the original node. The following function `node_children`
takes a node and returns a list of all possible children of the node:

```ats
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
```

The combinator `list0_nchoose_rest` takes a list `xs` and an integer `n0`
and returns a linear stream consisting of all of pairs such that
the first component of each pair is a sublist of `xs` of length `n0`
and the second component is the complement of the first component. For instance,
if `xs` equals (1, 2, 3, 4) and `n0` equals 2, then the following pairs
are in the stream returned by a call of `list0_nchoose_rest` on `xs` and `n0`:

((1,2),(3,4)),
((1,3),(2,4)),
((1,4),(2,3)),
((2,3),(1,4)),
((2,4),(1,3)), and ((3,4),(1,2)).

Note that the the following files need to be staloaded in order to use
`list0_nchoose_rest`:

```ats
#staload
"libats/temp/bucs320/SATS/mylist.sats"
#staload _ =
"libats/temp/bucs320/DATS/mylist.dats"
```

The combinator `list0_mapjoin` is essentially a composition of `list0_map` and
`list0_concat`: Given a list `xs`, `list0_map` maps each element in `xs` to a list
to form a list of lists, which is passed to `list0_concat` to be flattened and then
returned.

A template-based implementation for tree-based search is available in the
library:

```ats
(* ****** ****** *)

#staload GT =
"libats/temp/bucs320/SATS/gtree.sats"
#staload _(*GT*) =
"libats/temp/bucs320/DATS/gtree.dats"

(* ****** ****** *)
```

The template `gtree_streamize_dfs` can be called to enumerate the
nodes in a given tree in the depth-first fashion:

```ats
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
GT.gtree_streamize_dfs<node>(NX0)
) where
{
impltmp
GT.gtree_node_children<node>(NX0) = node_children(NX0)
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
```

Note that the template `gtree_node_children` needs to be implemented
in order for `gtree_streamize_dfs` to work.  By the way, one could
also use the template `gtree_streamize_bfs` to enumerate in the
breath-first fashion.

Given four integers n1, n2, n3, and n4, `Game_of_24` returns a
linear stream of expr-values formed using the 4 integers such that
each expr-value in the stream evaluates to 24. Note that
`stream_vt_mapopt` is like `stream_vt_map` except that mapping is
applied to an element only of the element satisfy certain condition
(specified by `stream_vt_mapopt$test`).

Please find the entirety of the program [here](./Game-of-24.dats).

Happy programming in ATS-Temptory!!!
