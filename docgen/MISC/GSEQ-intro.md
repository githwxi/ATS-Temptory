# Verbs for Batch-Processing

When teaching functional programming, I often get a question like:
How can one access an element in a list when given the index of the
element? It is mostly likely that the person who asks this question
is still of a mentality that focuses on what I call individual-processing
(instead of batch-processing). 

In functional programming, batch-processing is commonly associated with
the use of combinators (which are often higher-order functions of relatively
small bodies). Temptory strongly advocates batch-processing. And it does so
by making extensive use of templates.

  
## Common Verbs

I list as follows some common verbs and their variations in the
context of batch-processing elements sequentially. Note that an
implementation of a verb for a particular datatype is often referred
to as a combinator.

------

* listize
  It is for turning a given sequence into a linear list
* streamize
  It is for turning a given sequence into a linear stream
  
* exists:
  It is for processing a given sequence
  until the processing function returns true.
* forall:
  It is for processing a given sequence
  until the processing function returns false.

* foreach:
  It is for processing a given sequence in its entirety.
  
* foldleft:
  It is for processing a given sequence in its entirety and returning
  the accumulated result at the end
  
* map_list: It is for applying a give function to each element in a
  given sequence and returning a linear list consisting of the results
  of these applications in the order as they are produced.
  
* map_rlist: It is for applying a give function to each element in a
  given sequence and returning a linear list consisting of the results
  of these applications in the reverse order as they are produced.

* map_stream:
  It is for lazily applying a give function to each element in a given
  sequence and returning a linear stream consisting of the results of
  these applications in the order as they are produced.

------

* rexists:
  It is like `exists` but processing in done in the reverse order
* rforall:
  It is like `forall` but processing in done in the reverse order
* rforeach:
  It is like `foreach` but processing in done in the reverse order
* foldright:
  It is like `foldleft` but processing in done in the reverse order

* rmap_list:
  It is like `map_list` but processing in done in the reverse order
* rmap_rlist:
  It is like `map_rlist` but processing in done in the reverse order
* rmap_stream:
  It is like `map_stream` but processing in done in the reverse order

------

Given a sequence, the i-version of the sequence consists of pairs
where each pair is the index of an element coupled with the element
itself. For instance, the list the i-version of the list `(a, b, c)`
is simply `((0, a), (1, b), (2, c))`.

Given a verb, the i-version of the verb is often named `i<verb>`,
where `<verb>` stands for the name of the verb.  Basically, applying
the i-version of a verb to a given sequence is like applying the verb
to the i-version of the sequence.

* iexists: It is the i-version of `exists`
* iforall: It is the i-version of `forall`
* iforeach: It is the i-version of `foreach`
* ifoldleft: It is the i-version of `foldleft`

* imap_list: It is the i-version of `map_list`.
* imap_rlist: It is the i-version of `map_rlist`.
* imap_stream: : It is the i-version of `map_stream`.

------

* zforall: It is the z-version of `forall`.  
* zforeach: It is the z-version of `foreach`.
* zfoldleft: It is the z-version of `foldleft`.

* zmap_list: It is the z-version of `map_list`.
* zmap_rlist: It is the z-version of `map_rlist`.
* zmap_stream: It is the z-version of `map_stream`.

------

* xforall: It is the z-version of `forall`.    
* xforeach: It is the x-version of `foreach`.
* xfoldleft: It is the x-version of `foldleft`.

* xmap_list: It is the x-version of `map_list`.
* xmap_rlist: It is the x-version of `map_rlist`.
* xmap_stream: It is the x-version of `map_stream`.

------

I will be introducing more verbs elsewhere. My own experience
indicates the above list of verbs being adequate for average
programming needs.

## Verb Dependencies in the GSEQ package

Given two verbs `verb1` and `verb2`, I write `verb1 < verb2` to mean
that there is an implementation of `verb2` that depends on `verb1`. In
other words, `verb2` is available for use as long as `verb1` is
implemented. In the terms of OOP, one may see `verb2` as a method
whose implementation calls anther method `verb1`.  If `verb2` depends
on `verb1`, I may also say `verb1` supports `verb2`.

In the GSEQ package, the following verb dependecies exist:

* streamize < forall
* streamize < rforall

* forall < exists
* forall < foreach 
* foreach < foldleft
* foldleft < listize

* foldleft < map_list
* foldleft < map_rlist
* streamize < map_stream

* foldleft < imap_list
* foldleft < imap_rlist
* streamize < imap_stream

* forall < iforall
* iforall < iexists
* iforall < iforeach
* iforeach < ifoldleft

* rforall < rexists
* rforall < rforeach
* rforeach < foldright

There is really no need to memorize these verb dependencies at this
point.  All one really want to be clear about for now is that if
`streamize` is implemented, then all of the other verbs are available
for use.

## Let's see some verbs in action!

