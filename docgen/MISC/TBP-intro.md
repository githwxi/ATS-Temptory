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