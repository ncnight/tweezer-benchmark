#!/bin/bash

proc=$(grep -c processor /proc/cpuinfo)

cd ~/tweezer/Docker
make -C tweezer -j${proc} rocksdbjavastatic DEBUG_LEVEL=0 DISABLE_WARNING_AS_ERROR=1
make -C speicher_V1 -j${proc} rocksdbjavastatic DEBUG_LEVEL=0 DISABLE_WARNING_AS_ERROR=1
