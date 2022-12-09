#!/bin/bash

proc=$(grep -c processor /proc/cpuinfo)

cd ~/tweezer/Docker
make -C tweezer -j${proc} db_stress DEBUG_LEVEL=0
make -C tweezer -j${proc} db_bench DEBUG_LEVEL=0
make -C speicher_V1 -j${proc} db_stress DEBUG_LEVEL=0
make -C speicher_V1 -j${proc} db_bench DEBUG_LEVEL=0

mkdir ~/db_benchmarks
cp tweezer/db_stress ~/db_benchmarks/tweezer_stress
cp tweezer/db_bench ~/db_benchmarks/tweezer_bench
cp speicher_V1/db_stress ~/db_benchmarks/speicher_stress
cp speicher_V1/db_bench ~/db_benchmarks/speicher_bench
#make -C tweezer -j${proc} rocksdbjavastatic DEBUG_LEVEL=0 DISABLE_WARNING_AS_ERROR=1
#make -C speicher_V1 -j${proc} rocksdbjavastatic DEBUG_LEVEL=0 DISABLE_WARNING_AS_ERROR=1
