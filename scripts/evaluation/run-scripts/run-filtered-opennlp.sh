#!/bin/bash

# join output from stanford ner and test file
# evaluate results
for r in {1..3}
do
	for i in {0..9}
	do
		TOOL=../../../tools/open-nlp/outputs/repeat-$r/ner-results/fold-$i
		OUT_RES=../results/open-nlp/repeat-$r/fold-$i
		../join-output-golden.sh $TOOL/out-filtered.txt $TOOL/out-filtered-gold.txt | ../conlleval > $OUT_RES/filtered.txt
	done

	python ../src/avg-results.py open-nlp filtered $r
done