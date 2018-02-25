#!/bin/bash
PROBLEMSIZE=(1000 2000 4000 8000 16000 32000 64000)
ALGORITHM=(-1 -2)

for a in ${ALGORITHM[*]}
do
	for b in {1..3}
	do
		for c in ${PROBLEMSIZE[*]}
		do
			./benchmark $a $b $c 20
		done
	done
done
