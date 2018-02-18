#!/bin/bash

if [[ $@ != **-c** ]]; then 
	curl -s $1 > output.txt  
fi	

if [[ $@ == **-2** ]]; then 
	sort_arg=" -k 2 -r"
fi	

rm result.txt
for word in `cat words.txt`; do
	echo "$word `grep -io  $word output.txt \
	| wc -l`" \
	| xargs  >> result.txt
done; cat result.txt | sort -n $sort_arg