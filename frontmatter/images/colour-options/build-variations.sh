#!/usr/bin/env bash
for sat in {1..3}; do
	for val in {1..3}; do
		echo $sat $val
		for i in $(seq -w 00 05 95); do
			mkdir -p sat-$sat-val-$val
			python3 ../inter/colour-replace.py cover-puzzle-ColorReplaceBase.svg 0.$i \
				$(echo "(2.5 * $sat) / 10" | bc -l) \
				$(echo "(2.5 * ($sat + 1)) / 10" | bc -l) \
				$(echo "(2.5 * $val) / 10" | bc -l) \
				$(echo "(2.5 * ($val + 1)) / 10" | bc -l) \
				10 \
			> sat-$sat-val-$val/out-$i.svg;
		done
	done
done
