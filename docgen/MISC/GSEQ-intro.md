# Verbs for Sequencial Batch-Processing

When teaching functional programming, I often get a question like:
How can one access an element in a list when given the index of the
element? It is mostly likely that the person who asks this question
is still of a mentality that focuses on what I call individual-processing
(instead of batch-processing). Temptory advocates batch-processing.
I list as follows some common verbs and their variations in the context
of batch-processing elements in sequences.
  
* listize:
  For turning a given sequence into a linear list

* streamize:
  For turning a given sequence into a linear stream

* forall:
  For processing a given sequence in its entirety or
  until the processing function returns false.

* foreach:
  For processing a given sequence in its entirety
  
* foldleft:
  For processing a given sequence in its entirety and returning
  the accumulated result at the end
  
* map_list:
  For applying a give function to each element in a given sequence and
  returning a linear list consisting of the results of these
  applications in the order as they are produced.
  
* map_rlist:
  For applying a give function to each element in a given sequence and
  returning a linear list consisting of the results of these
  applications in the reverse order as they are produced.

* map_stream:
  For lazily applying a give function to each element in a given
  sequence and returning a linear stream consisting of the results of
  these applications in the order as they are produced.

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

* iforall:
  It is like `forall` but processing is done to each pair consisting of
  the index of an element and the element itself. Often `iforall` is
  referred to as the i-version of `forall`.
* iforeach: It is the i-version of `foreach`
* ifoldleft: It is the i-version of `foldleft`

* imap_list: It is the i-version of `map_list`
* imap_rlist: It is the i-version of `map_rlist`
* imap_stream: : It is the i-version of `map_stream`

* zlistize
* zstreamize
* zforall
* zforeach
* zfoldleft
* zmap_list
* zmap_rlist
* zmap_stream

* xlistize
* xstreamize
* xforall
* xforeach
* xfoldleft
* xmap_list
* xmap_rlist
* xmap_stream
