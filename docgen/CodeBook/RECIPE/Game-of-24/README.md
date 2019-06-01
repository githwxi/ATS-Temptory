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

Let first declare a datatype `expr` for values representing arithmetic expressions:

```ats
datatype expr =
| Int of int
| Add of (expr, expr)
| Sub of (expr, expr)
| Mul of (expr, expr)
| Div of (expr, expr)

typedef exprs = list0(expr)
```

The function `print_expr` is for printing expr-values:

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


Happy programming in ATS-Temptory!!!
