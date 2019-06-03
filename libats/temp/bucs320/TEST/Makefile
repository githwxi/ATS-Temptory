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
-O2 -DATS_MEMALLOC_LIBC -D_GNU_SOURCE

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
all:: test02_dats
all:: test03_dats
all:: test04_dats
all:: test05_dats
all:: test06_dats
all:: test07_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

test01_dats: \
test01.dats; $(TEMPACC) -o $@ $<

######

test02_dats: \
test02.dats; $(TEMPACC) -o $@ $<

######

test03_dats: \
test03.dats; $(TEMPACC) -o $@ $<

######

test04_dats: \
test04.dats; $(TEMPACC) -o $@ $<

######

test05_dats: \
test05.dats; $(TEMPACC) -o $@ $<

######

test06_dats: \
test06.dats; $(TEMPACC) -o $@ $< $(MYLIBS)

######

test07_dats: \
test07.dats; $(TEMPACC) -o $@ $< $(MYLIBS)

######

regress:: test01_dats; ./test01_dats
regress:: test02_dats; ./test02_dats
regress:: test03_dats; ./test03_dats
regress:: test04_dats; ./test04_dats
regress:: test05_dats; ./test05_dats
regress:: test06_dats; ./test06_dats
regress:: test07_dats; ./test07_dats

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) a.out
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats
cleanall:: ; $(RMF) test02_dats
cleanall:: ; $(RMF) test03_dats
cleanall:: ; $(RMF) test04_dats
cleanall:: ; $(RMF) test05_dats
cleanall:: ; $(RMF) test06_dats
cleanall:: ; $(RMF) test07_dats

###### end of [Makefile] ######
