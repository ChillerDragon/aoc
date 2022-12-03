#!/bin/bash

declare -A get_prio
i=0
for l in {a..z} {A..Z}
do
	i=$((i + 1))
	get_prio["$l"]="$i"
done

declare -a prios
while read -r item
do
	len="${#item}"
	mid=$((len/2))
	cmp1="${item::mid}"
	cmp2="${item:mid}"
	while read -r t1
	do
		if echo "$cmp2" | grep -q "$t1"
		then
			prios+=("${get_prio["$t1"]}")
			break
		fi
	done < <(echo "$cmp1" | grep -o . | sort -u)
done < 03.txt

echo "$(IFS=+; echo "$((${prios[*]}))")"
