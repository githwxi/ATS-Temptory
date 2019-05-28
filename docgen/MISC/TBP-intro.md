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

## Motivating Examples for Templates

### Equality Types in SML

The notion of equality types in SML may be seen as the origin of type
classes in Haskell. Basically, an equality type in SML is one that
supports polymorphic equality (=), which is given the type ''a * ''a
-> bool (instead of 'a * 'a -> bool). In other words, a type variable
''a can only be instantiated with an equality type.

There are no polymorphic equality in Temptory. Instead, there is a (function)
template of the name gequal$val that is given the following interface:

fun
{a:tflt}
gequal$val(a, a): bool

fun
(a1,a2:tflt)
tuple2_equal
(xx: (a1, a2), yy: (a1, a2)): bool =
gequal$val<a1>(xx.0, yy.0) andalso gequal$val<a1>(xx.1, yy.1)