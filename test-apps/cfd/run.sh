#!/bin/bash

if [ $# -gt 0 ]; then
  CUDAPATH=$1
  STREAMS=$2
fi

RADDIR=/home/carol/radiation-benchmarks
DATA=${RADDIR}/data/cfd
INPUT_BASE=missile.domn.0.2M
INPUT=${DATA}/${INPUT_BASE}
GOLD=${DATA}/cfd_gold_${INPUT_BASE}

eval LD_LIBRARY_PATH=${CUDAPATH}/lib64:$LD_LIBRARY_PATH ${PRELOAD_FLAG} ${BIN_DIR}/cudaCFD --streams ${STREAMS} --input ${INPUT} --gold ${GOLD} --iterations 1 --verbose > stdout.txt 2> stderr.txt

sed -i '/Kernel time/c\REPLACED.' stdout.txt
sed -i '/LOGFILE/c\REPLACED.' stdout.txt 
sed -i '/read../c\REPLACED.' stdout.txt 
sed -i '/^$/d' stdout.txt
