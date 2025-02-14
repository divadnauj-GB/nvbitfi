#!/bin/bash

SIZE=1024
SIMT=100
DATADIR=/home/carol/radiation-benchmarks/data/hotspot
PRECISION=double

eval ${PRELOAD_FLAG} ${BIN_DIR}/cuda_trip_hotspot_${PRECISION} -size=${SIZE} -input_power=${DATADIR}/power_${SIZE} -input_temp=${DATADIR}/temp_${SIZE} -gold=${DATADIR}/hotspot_${PRECISION}_${SIZE}_${SIMT} -sim_time=${SIMT} -iterations=1 -verbose > stdout.txt 2> stderr.txt

sed -i '/readInput time/c\' stdout.txt 
sed -i '/Iteration/c\' stdout.txt 
