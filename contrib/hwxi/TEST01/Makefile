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
NPM=npm
RMF=rm -f

######

TEMPOPT= $(TEMPTORY)/bin/tempopt
TEMPACC= $(TEMPTORY)/bin/tempacc
# TEMPACC= \
# $(TEMPTORY)/bin/tempacc -cleanaft

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

######

testall:: all
testall:: regress
testall:: cleanall

######

test01_dats: \
test01.dats; \
$(TEMPACC) -D_GNU_SOURCE \
-DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test02_dats: \
test02.dats; \
$(TEMPACC) -D_GNU_SOURCE \
-DATS_MEMALLOC_LIBC -I./node_modules -o $@ $< $(MYLIBS) -lpcre

######

regress:: test01_dats; ./test01_dats
regress:: test02_dats; ./test02_dats

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats
cleanall:: ; $(RMF) test02_dats

######

npm-install: ; $(NPM) install

######

export \
PATSHOMELOCS = \
./node_modules:./../node_modules:./../../node_modules:./../../../node_modules

###### end of [Makefile] ######
