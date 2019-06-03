
######
#
# A simple Makefile
#
######

ACC=gcc \
-std=c99 -D_XOPEN_SOURCE \
-DATS_MEMALLOC_LIBC $(INCLUDE)

# ACC=g++ \
# -fpermissive -w \
# -DATS_MEMALLOC_LIBC $(INCLUDE)

CAT=cat 
RMF=rm -f

######

TEMPOPT= \
$(TEMPTORY)/bin/tempopt
TEMPACC= \
$(TEMPTORY)/bin/tempacc -O2
# TEMPACC= \
# $(TEMPTORY)/bin/tempacc -cleanaft

######

INCLUDE :=
INCLUDE += -I${TEMPTORY}
INCLUDE += -I${TEMPTORY}/ccomp/runtime 

######

all:: QueenPuzzle_dats
all:: QueenPuzzle_vt_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

QueenPuzzle_dats: \
QueenPuzzle.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

QueenPuzzle_vt_dats: \
QueenPuzzle_vt.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<

######

regress:: QueenPuzzle_dats; ./QueenPuzzle_dats
regress:: QueenPuzzle_vt_dats; ./QueenPuzzle_vt_dats

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) a.out
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) QueenPuzzle_dats
cleanall:: ; $(RMF) QueenPuzzle_vt_dats

###### end of [Makefile] ######
