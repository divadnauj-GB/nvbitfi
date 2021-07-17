#!/bin/bash

RADDIR=/home/carol/radiation-benchmarks/data/mergesort
SIZE=1048576
CUDAPATH=/usr/local/cuda
if [ $# -gt 0 ]; then
  CUDAPATH=$1
  SIZE=$2
fi


eval ${PRELOAD_FLAG}  ${BIN_DIR}/mergesort -size=${SIZE} -input=${RADDIR}/mergesort_input_134217728 -gold=${RADDIR}/mergesort_gold_${SIZE} -iterations=1 -verbose > stdout.txt 2> stderr.txt
sed -i '/LOGFILENAME/c\' stdout.txt 
sed -i '/Time/c\' stdout.txt 
sed -i '/time/c\' stdout.txt 
sed -i '/^$/d' stdout.txt
sed -i '/Perf/c\' stdout.txt
sed -i '/Starting/c\' stdout.txt
