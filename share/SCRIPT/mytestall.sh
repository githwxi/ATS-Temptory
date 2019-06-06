#!/bin/sh

######
#
# HX-2019-06:
# For testing ATS-Temptory locally
# The testing code is used in .travis.yml
#
######

(cd ${TEMPTORY}/libats/libc/TEST && make -f Makefile testall)
(cd ${TEMPTORY}/libats/temp/TEST && make -f Makefile testall)

(cd ${TEMPTORY}/libats/temp/bucs320/TEST && make -f Makefile testall)
(cd ${TEMPTORY}/libats/temp/bucs520/TEST && make -f Makefile testall)

(cd ${TEMPTORY}/docgen/UNSORTED/CODE && make -f Makefile testall)
(cd ${TEMPTORY}/docgen/CodeBook/RECIPE && make -f Makefile_test testall)

(cd ${TEMPTORY}/contrib/githwxi/TEST00 && make -f Makefile testall)
(cd ${TEMPTORY}/contrib/githwxi/TEST01 && make -f Makefile testall)

###### end of [testall.sh] ######
