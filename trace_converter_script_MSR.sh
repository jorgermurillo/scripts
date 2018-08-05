#!/bin/bash

#INPUT is the trace file to convert
#OUTPUT is the name of the file with the resulting trace
#newseparator is the separator used for the new tracefile

INPUT=$1
OUTPUT=$2
newseparator=$3
separator=","
#timestamp=$(cat $INPUT | cut -f 1 -d " "  )

> $OUTPUT

while IFS=$separator read -ra ARRAY || [[ -n "$ARRAY" ]]; do
	
	TIMESTAMP=${ARRAY[0]}
	COMMAND=${ARRAY[3]}
	ID=${ARRAY[4]}
	
	#ID2=$(echo $ID  | cut -f 2 -d "," | cut -c 45-64)
	
	#echo $ID2  >> $OUTPUT	
	echo $COMMAND$newseparator$ID$newseparator$TIMESTAMP >> $OUTPUT

done < $INPUT

