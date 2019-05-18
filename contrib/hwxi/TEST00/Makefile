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

all:: test00
all:: test01_dats
all:: test02_dats
all:: test03_dats
all:: test04_dats
all:: test05_dats
all:: test06_dats
all:: test07_dats
all:: test08_dats
all:: test09_dats
all:: test10_dats
all:: test11_dats
all:: test12_dats
all:: test13_dats
all:: test14_dats
all:: test15_dats
all:: test16_dats
all:: test17_dats
all:: test18_dats

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
test05_dats.c; $(ACC) -o $@ $<
test05_dats.c: test05.dats; $(TEMPOPT) -o $@ -d $<

######

test06_dats: \
test06.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<

######

test07_dats: \
test07.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<

######

test08_dats: \
test08.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<

######

test09_dats: \
test09.dats; $(TEMPACC) -DATS_MEMALLOC_LIBC -o $@ $<

######

test10_dats: \
test10.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test11_dats: \
test11.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test12_dats: \
test12.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test13_dats: \
test13.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test14_dats: \
test14.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test15_dats: \
test15.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test16_dats: \
test16.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test17_dats: \
test17.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

test18_dats: \
test18.dats; \
$(TEMPACC) -D_GNU_SOURCE -DATS_MEMALLOC_LIBC -o $@ $< $(MYLIBS)

######

regress:: test01_dats; ./test01_dats
regress:: test02_dats; ./test02_dats
regress:: test03_dats; ./test03_dats
regress:: test04_dats; ./test04_dats
regress:: test05_dats; ./test05_dats
regress:: test06_dats; ./test06_dats
regress:: test07_dats; ./test07_dats
regress:: test08_dats; ./test08_dats
regress:: test09_dats; ./test09_dats
regress:: test10_dats; ./test10_dats
regress:: test11_dats; ./test11_dats
regress:: test12_dats; ($(CAT) ./test12.dats | ./test12_dats)
regress:: test13_dats; ./test13_dats
regress:: test14_dats; ./test14_dats
regress:: test15_dats; ./test15_dats
regress:: test16_dats; ./test16_dats
regress:: test17_dats; ./test17_dats
regress:: test18_dats; ./test18_dats

######

clean:: ; $(RMF) *~
clean:: ; $(RMF) *_?ats.c

cleanall:: clean
cleanall:: ; $(RMF) test01_dats
cleanall:: ; $(RMF) test02_dats
cleanall:: ; $(RMF) test03_dats
cleanall:: ; $(RMF) test04_dats
cleanall:: ; $(RMF) test05_dats
cleanall:: ; $(RMF) test06_dats
cleanall:: ; $(RMF) test07_dats
cleanall:: ; $(RMF) test08_dats
cleanall:: ; $(RMF) test09_dats
cleanall:: ; $(RMF) test10_dats
cleanall:: ; $(RMF) test11_dats
cleanall:: ; $(RMF) test12_dats
cleanall:: ; $(RMF) test13_dats
cleanall:: ; $(RMF) test14_dats
cleanall:: ; $(RMF) test15_dats
cleanall:: ; $(RMF) test16_dats
cleanall:: ; $(RMF) test17_dats
cleanall:: ; $(RMF) test18_dats

###### end of [Makefile] ######
