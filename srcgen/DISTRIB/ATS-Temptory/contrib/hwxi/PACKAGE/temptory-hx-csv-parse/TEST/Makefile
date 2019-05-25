######
#
# A simple Makefile
#
######

TEMPACC=$(TEMPTORY)/bin/tempacc
TEMPOPT=$(TEMPTORY)/bin/tempopt

######

all:: \
test01
test01: \
test01.dats ; \
$(TEMPACC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test01; ./$<
cleanall:: ; $(RMF) test01

######

all:: \
test02
test02: \
test02.dats ; \
$(TEMPACC) -O2 -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $<
regress:: test02; ./$<
cleanall:: ; $(RMF) test02

######

RMF=rm -f

######

testall:: all
testall:: regress
testall:: cleanall

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c
clean:: ; $(RMF) *_?ats.o

######

cleanall:: clean

######
#
export \
PATSHOMELOCS=\
./node_modules:./../node_modules:./../../node_modules
#
###### end of [Makefile] ######
