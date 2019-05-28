# What is Template-Based Programming?

Template-Based Programming (TBP) advocates the use of (function)
templates in place of functions. A template generalizes the notion of
function to support a form of (extreme) late-binding. Conceptually,
one may think of templates as functions containing knobs or switches
inside their bodies that can be controlled contextually at compile-time. 

Various aspects of templates have already appeared in languages such
as LISP (macros), Haskell (type classes), Scala (implicits), etc. One
may also see the way in which a template instance (that is, a call of
the template) is finalized (at compile-time) direcly corresponds to a
method in an object being dispatched (at run-time).

## Some Motivating Examples for Templates

### Equality Types in SML

The notion of equality types in SML may be seen as the origin of
type classes in Haskell. Basically, an equality type in SML is one
that supports polymorphic equality (=), which is given the type `''a *
''a -> bool` (instead of `'a * 'a -> bool`). In other words, a type
variable `''a` can only be instantiated with an equality type.

There is no polymorphic equality in Temptory. In order to test
whether two given lists are equal, one could try to implement a
function template of the following type:

extern
fun
{a:tflt}
list0_fequal
(xs: list0(a), ys: list0(a), eq: (a, a) -> bool): bool

This is a workable solution but suffers from the requirement that each
caller of `list0_fequal` must pass to it explicitly a function
argument (for testing equality on elements in the two given lists).

There is a template-based solution to implementing equality test on
lists. In Temptory, the template `gequal$val` is given the following
interface:

```ats
fun
{a:tflt}
gequal$val(a, a): bool
```

We can define as follows a function `list0_equal` to test whether two
given lists are equal:

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
automatically find an implementation of `gequal$val<int>` needed for
compiling `list0_equal<int>`.