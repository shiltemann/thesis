#!/usr/bin/env bash
for i in $(seq -w 00 05 95); do
	echo $i;
	python3 colour-replace.py cover-puzzle-helix.svg 0.$i > out-$i.svg;
done
