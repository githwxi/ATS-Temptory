######
#
# A simple Makefile
#
######

GCC=gcc \
-std=c99 -D_XOPEN_SOURCE

CPP=g++ \
-fpermissive -w \
-DATS_MEMALLOC_LIBC $(INCLUDE)

RMF=rm -f

######

TEMPOPT= $(TEMPTORY)/bin/tempopt
TEMPACC= $(TEMPTORY)/bin/tempacc
# TEMPACC= \
# $(TEMPTORY)/bin/tempacc -cleanaft

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

testall:: all
testall:: regress
testall:: cleanall

######

test00: \
test00.dats; $(TEMPACC) -tcats -d $<

######

test01_dats: test01.dats; $(TEMPACC) -o $@ $<
test02_dats: test02.dats; $(TEMPACC) -o $@ $<

######

test03_dats: \
test03.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<
test04_dats: \
test04.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<

######

test05_dats: \
test05_dats.c; $(CPP) -o $@ $<
test05_dats.c: test05.dats; $(TEMPOPT) -o $@ -d $<

######

regress:: test01_dats; ./test01_dats
regress:: test02_dats; ./test02_dats
regress:: test03_dats; ./test03_dats
regress:: test04_dats; ./test04_dats
regress:: test05_dats; ./test05_dats

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
