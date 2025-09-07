#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo "#==========================================================="
echo "Start Times"

for file in *.out; do
	echo -n "==> "
	echo -n $file
	echo " <=="
	cat $file | \
	awk 'NR == 1 { print; exit }'
done

echo "End Times"

for file in *.out; do
	echo -n "==> "
	echo -n $file
	echo " <=="
	tail -n 5 $file
done

echo "#==========================================================="
