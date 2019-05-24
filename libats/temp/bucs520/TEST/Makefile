######
#
# A simple Makefile
#
######

RMF=rm -f

######

TEMPOPT= \
$(TEMPTORY)/bin/tempopt
TEMPACC= \
$(TEMPTORY)/bin/tempacc \
-DATS_MEMALLOC_LIBC -D_GNU_SOURCE

######

MYLIBS :=
MYLIBS += mylib.sats
MYLIBS += mylib.dats

######

INCLUDE :=
INCLUDE += -I${TEMPTORY}
INCLUDE += -I${TEMPTORY}/ccomp/runtime 

######

all:: test01_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

test01_dats: \
test01.dats; $(TEMPACC) -o $@ $<

######

regress:: test01_dats; ./test01_dats

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats

###### end of [Makefile] ######
