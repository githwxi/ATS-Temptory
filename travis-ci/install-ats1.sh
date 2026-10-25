#!/usr/bin/env sh

######
#
# Author: Kiwamu Okabe
# Author: Hongwei Xi (tidying-up)
#
######
#
# for installing ats-anairiats
#
######
#
ATSVER=$1
#
ATSPACK=\
ats-lang-anairiats-${ATSVER}
#
ATSPACKTGZ=${ATSPACK}.tgz
#
######
#
TARZXF="tar -zxf"
#
######
#
SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ATSPACKPATH=${SCRIPT_DIR}/../xassets/ATS1/${ATSPACKTGZ}
#
######
#
${TARZXF} -C "$HOME" "$ATSPACKPATH"
#
######
#
# HX-2014-12-16:
# The rest is moved into .travis.yml
#
######
#
# ./configure; make all
#
######
#
# -- If you do
#
# ./configure; make all_ngc
#
# -- Please remember to use the following
# -- command-line later when building ATS2
#
# make GCFLAG=-D_ATS_NGC all
#
######

(mv -f "$HOME/$ATSPACK" "$HOME/ATS1")

###### end of [install-ats1.sh] ######
