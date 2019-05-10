######
#
# A simple Makefile
#
######

GCC=gcc \
-std=c99 -D_XOPEN_SOURCE

TEMPOPT= $(TEMPTORY)/bin/tempopt

######

INCLUDE :=
INCLUDE += -I${TEMPTORY}
INCLUDE += -I${TEMPTORY}/ccomp/runtime 

######

all:: test00
all:: test01_dats
all:: test02_dats
all:: test03_dats

######

test00: \
test00.dats; $(TEMPOPT) -tc -d $<

######

test01_dats: \
test01_dats.c; $(GCC) $(INCLUDE) -o $@ $<
test01_dats.c: test01.dats; $(TEMPOPT) -cc -o $@ -d $<

######

test02_dats: \
test02_dats.c; $(GCC) $(INCLUDE) -o $@ $<
test02_dats.c: test02.dats; $(TEMPOPT) -cc -o $@ -d $<

######

test03_dats: \
test03_dats.c ; \
$(GCC) -DATS_MEMALLOC_LIBC $(INCLUDE) -o $@ $<
test03_dats.c: test03.dats; $(TEMPOPT) -cc -o $@ -d $<

######

test04_dats: \
test04_dats.c ; \
$(GCC) -DATS_MEMALLOC_LIBC $(INCLUDE) -o $@ $<
test04_dats.c: test04.dats; $(TEMPOPT) -cc -o $@ -d $<

######

test05_dats: \
test05_dats.c ; \
$(GCC) -DATS_MEMALLOC_LIBC $(INCLUDE) -o $@ $<
test05_dats.c: test05.dats; $(TEMPOPT) -cc -o $@ -d $<

######

regress:: \
test01_dats; ./test01_dats
regress:: \
test02_dats; ./test02_dats
regress:: \
test03_dats; ./test03_dats
regress:: \
test04_dats; ./test04_dats
regress:: \
test05_dats; ./test05_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

RMF=rm -f

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats
cleanall:: ; $(RMF) test02_dats
cleanall:: ; $(RMF) test03_dats
cleanall:: ; $(RMF) test04_dats
cleanall:: ; $(RMF) test05_dats

###### end of [Makefile] ######
