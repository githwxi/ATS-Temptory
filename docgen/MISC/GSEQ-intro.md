# Verbs for Batch-Processing

When teaching functional programming, I often get a question like:
How can one access an element in a list when given the index of the
element? It is mostly likely that the person who asks this question
is still of a mentality that focuses on what I call individual-processing
(instead of batch-processing). Temptory advocates batch-processing.

## Common Verbs

I list as follows some common verbs and their variations in the
context of batch-processing elements sequentially. Note that an
implementation of a verb for a particular datatype is often referred
to as a combinator.

------
  
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

* iforall:
  It is like `forall` but processing is done to each pair consisting of
  the index of an element and the element itself. Often `iforall` is
  referred to as the i-version of `forall`.
* iforeach: It is the i-version of `foreach`
* ifoldleft: It is the i-version of `foldleft`

* imap_list: It is the i-version of `map_list`.
* imap_rlist: It is the i-version of `map_rlist`.
* imap_stream: : It is the i-version of `map_stream`.

------

* zforall:
  It is the z-version of `forall` that can be understood
  as applying `forall` to the sequence obtained from zipping
  the two sequences passed as the given arguments of `zforall`.
  For those knowing vector arithmetic, zipping is performed
  for computing inner product.
  
* zforeach: It is the z-version of `foreach`.
* zfoldleft: It is the z-version of `foldleft`.

* zmap_list: It is the z-version of `map_list`.
* zmap_rlist: It is the z-version of `map_rlist`.
* zmap_stream: It is the z-version of `map_stream`.

------

* xforall:
  It is the x-version of `forall` that can be understood
  as applying `forall` to the sequence obtained from crossing
  the two sequences passed as the given arguments of `xforall`.
  For those knowing vector arithmetic, crossing is performed
  for computing outer product.
  
* xforeach:
  It is the x-version of `foreach`.
* xfoldleft: It is the x-version of `foldleft`.

* xmap_list: It is the x-version of `map_list`.
* xmap_rlist: It is the x-version of `map_rlist`.
* xmap_stream: It is the x-version of `map_stream`.

------

I will be introducing more verbs elsewhere. I find the above list
of verbs to be adequate for average programming needs.

## Verb Dependency in the GSEQ package

Given two verbs `verb1` and verb2`, I write `verb1 < verb2` to
indication there is an implementation of `verb2` in the GSEQ package
that depends on `verb1`. In other words, `verb2` is available for use
as long as `verb1` is implemented. In the terms of OOP, one may see
`verb2` as a method whose implementation calls anther method `verb1`.