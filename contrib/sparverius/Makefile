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

# set TEMPTORY to different directory
# by specifying TMP

TMP=
NONE=

ifneq ($(TMP),$(NONE))
export TEMPTORY=$(TMP)
endif

TEMPOPT= $(TEMPTORY)/bin/tempopt
TEMPACC= $(TEMPTORY)/bin/tempacc -O2

######

INCLUDE :=
INCLUDE += -I${TEMPTORY}
INCLUDE += -I${TEMPTORY}/ccomp/runtime

######

all:: test01_dats
all:: test02_dats
all:: test03_dats

######

testall:: all
testall:: regress
testall:: cleanall

######

test01_dats: \
test01.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<
test02_dats: \
test02.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<
test03_dats: \
test03.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<

######

regress:: test01_dats; ./test01_dats
regress:: test02_dats; ./test02_dats
regress:: test03_dats; ./test03_dats

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) a.out
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats
cleanall:: ; $(RMF) test02_dats
cleanall:: ; $(RMF) test03_dats

###### end of [Makefile] ######
