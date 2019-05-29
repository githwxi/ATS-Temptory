# Verbs for Sequencial Processing

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
  
* map_rlist
  For applying a give function to each element in a given sequence and
  returning a linear list consisting of the results of these
  applications in the reverse order as they are produced.

* map_stream
  For lazily applying a give function to each element in a given
  sequence and returning a linear stream consisting of the results of
  these applications in the order as they are produced.

* rforall
* rforeach
* foldright
* rmap_list
* rmap_rlist
* rmap_stream

* iforall
* iforeach
* ifoldleft
* imap_list
* imap_rlist
* imap_stream

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
