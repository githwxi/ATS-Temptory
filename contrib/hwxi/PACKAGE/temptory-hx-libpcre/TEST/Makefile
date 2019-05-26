######
#
# A simple Makefile
#
######

TEMPTORYQ="$(TEMPTORY)"

######

TEMPACC=$(TEMPTORYQ)/bin/tempacc
PATSOPT=$(TEMPTORYQ)/bin/patsopt

######

all::
regress::
cleanall::

######

INCLUDE=./../..

######

all:: \
test00
test00: \
test00.dats ; $(TEMPACC) -I$(INCLUDE) -o $@ $< -lpcre
regress:: test00; ./$<
cleanall:: ; $(RMF) test00

######

all:: \
test01
test01: \
test01.dats ; \
$(TEMPACC) -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@ $< -lpcre
regress:: test01; ./$<
cleanall:: ; $(RMF) test01

######
#
all:: \
test02
test02: test02.dats ; \
$(TEMPACC) -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@ $< -lpcre
#
regress:: test02; ./$<
cleanall:: ; $(RMF) test02
#
######
#
all:: \
test03
test03: test03.dats ; \
$(TEMPACC) -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@ $< -lpcre
#
regress:: test03; ./$<
cleanall:: ; $(RMF) test03
#
######
#
all:: \
test04
test04: \
test04.dats ; \
$(TEMPACC) -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@ $< -lpcre
#
regress:: test04; ./$<
cleanall:: ; $(RMF) test04
#
######
#
all:: \
test05
test05: \
test05.dats ; \
$(TEMPACC) -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@ $<  -lpcre
#
regress:: \
test05 ; \
cat test05.dats | ./test05
#
cleanall:: ; $(RMF) test05
#
######
#
all:: \
test06
test06: \
test06.dats ; \
$(TEMPACC) -DATS_MEMALLOC_LIBC -I$(INCLUDE) -o $@ $<  -lpcre
#
regress:: \
test06 ; \
cat test06.dats | ./test06
#
cleanall:: ; $(RMF) test06
#
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

###### end of [Makefile] ######
