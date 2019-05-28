# What is Template-Based Programming?

Template-Based Programming (TBP) advocates the use of (function)
templates in place of functions. A template generalizes the notion of
function to support a form of late-binding at compile-time.
Conceptually, one may think of templates as functions containing knobs
or switches inside their bodies that can be controlled from the
outside.

Various aspects of templates have already appeared in languages such
as LISP (macros), Haskell (type classes), Scala (implicits), etc. One
may also see the way in which a template instance (that is, a call of
the template) is finalized (at compile-time) corresponds direcly to a
method in an object being dispatched (at run-time).

There are plenty of motivating examples for templates. For the moment,
let us take a look at equality types in Standard ML (SML).

The notion of equality types in SML may be seen as the origin of type
classes in Haskell. Basically, an equality type in SML is one that
supports polymorphic equality (=), which is given the type `''a * ''a
-> bool` (instead of `'a * 'a -> bool`). In other words, a type variable
`''a` can only be instantiated with an equality type.
  
There is no polymorphic equality in Temptory. In order to test whether
two given lists (of the same generic type) are equal, one could try to
implement a function template of the following type:

```ats
extern
fun
{a:tflt}
list0_fequal
(xs: list0(a), ys: list0(a), eq: (a, a) -> bool): bool
```

This is a workable solution based on higher-order function
but it suffers from the requirement that each caller of `list0_fequal`
must pass to it explicitly a function argument (for testing equality
on elements in the two given lists).

Let us see a template-based solution to implementing equality test on
lists. In Temptory, the name `gequal$val` refers to a template of the
following interface:

```ats
fun
{a:tflt}
gequal$val(a, a): bool
```

Note that the sort `tflt` indicates the type variable
`a` range over flat types (that is, types of unspecified sizes).
A function `list0_equal` can be defined as follows to test whether two
given lists are equal by calling `gequal$val` to test equality on elements:

```ats
extern
fun
{a:tflt}
list0_equal
(xs: list0(a), ys: list0(a)): bool
implement
{a}(*tmp*)
list0_equal
  (xs, ys) =
( loop(xs, ys) ) where
{
fun
loop
( xs: list0(a)
, ys: list0(a) ): bool =
(
case+ xs of
| list0_nil() =>
  (
  case+ ys of
  | list0_nil() => true
  | list0_cons _ => false
  )
| list0_cons(x0, xs) =>
  (
  case+ ys of
  | list0_nil() => true
  | list0_cons(y0, ys) =>
    let
      val ans =
      gequal$val<a>(x0, y0)
    in
      if ans then loop(xs, ys) else false
    end
  )
) (* end of [loop] *)
} (* end of [list0_equal] *)
```

Note that `gequal$val` is already given a standard implementation on
basic types like int, bool, char, string, etc. If `list0_equal` is
called on two lists of the type `list0(int)`, the compiler can
*automatically* find an implementation of `gequal$val<int>` needed for
compiling `list0_equal<int>`.

Templates in Temptory are embeddable in the sense that they can be
implemented in the body of a function. For instance, the previous template
`list0_fequal` can be given an implementation based on `list0_equal`
as follows:


```ats
implement
{a}(*tmp*)
list0_fequal
  (xs, ys, eq) =
(
  list0_equal<a>(xs, ys)
) where
{
  implement gequal$val<a>(x, y) = eq(x, y)
}
```

It will beome clear soon that the embeddability of templates can have
great impact on the way in which a program is structured.

With the above simple example, I have demonstrated a bit of TBP where
templates are employed to replace higher-order functions.  While this
is a typical entry point for TBP, there are many more aspects of TBP
are yet to be explored.
