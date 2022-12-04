#!/bin/bash

sum=0
sum2=0
while IFS=, read -r e1 e2
do
	f1="${e1%%-*}"
	t1="${e1#*-}"
	f2="${e2%%-*}"
	t2="${e2#*-}"

	if [[ ( "$f1" -le "$f2" && "$t1" -ge "$t2" ) || ( "$f2" -le "$f1" && "$t2" -ge "$t1" ) ]]
	then
		sum="$((sum + 1))"
		sum2="$((sum2 + 1))"
	elif [[ ( "$f1" -le "$f2" && "$t1" -ge "$f2" ) || ( "$f1" -le "$t2" && "$t1" -ge "$t2" ) ]]
	then
		sum2="$((sum2 + 1))"
	fi
done < 04.txt
echo "$sum"
echo "$sum2"

