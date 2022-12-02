#!/bin/bash

# A rock
# B paper
# C scissors

# X 1 rock
# Y 2 paper
# Z 3 scissor

# los 0
# drw 3
# win 6

function compute() {
	cp 02.txt 02.tmp

	for play in "${!scores[@]}"
	do
		sed "s/$play/${scores[$play]}/g" 02.tmp > 02.tmp.tmp
		mv 02.tmp.tmp 02.tmp
	done

	tr '\n' '+' < 02.tmp | sed 's/+$//g' | awk '{ print "echo $((" $0 "))" }' | sh
}

declare -A scores=(
	['A X']=4
	['A Y']=8
	['A Z']=3
	['B X']=1
	['B Y']=5
	['B Z']=9
	['C X']=7
	['C Y']=2
	['C Z']=6
)

compute

# X los
# Y drw
# Z win

declare -A scores=(
	['A X']=3
	['A Y']=4
	['A Z']=8
	['B X']=1
	['B Y']=5
	['B Z']=9
	['C X']=2
	['C Y']=6
	['C Z']=7
)

compute

rm 02.tmp
