#!/bin/bash
input="input.csv"
output="result.txt"

if [ ! -f "$input" ]; then
	echo "$input not found."
fi
if [ -f $output ]; then
	rm -f $output
fi

sed -n -e 's/, [^ ]*/;/w  tempResult.txt' input.csv
sed -i '' '$ s/.$//' tempResult.txt
tr -d '\n' < tempResult.txt >> $output

rm -f tempResult.txt
