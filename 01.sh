#!/bin/sh

tr '\n' ' ' < 01.txt | sed 's/  /\n/g' | sed 's/ /+/g' | sed 's/+$//g' | awk '{ print "echo $((" $0 "))" }' | sh | sort -n | tail -n 1
tr '\n' ' ' < 01.txt | sed 's/  /\n/g' | sed 's/ /+/g' | sed 's/+$//g' | awk '{ print "echo $((" $0 "))" }' | sh | sort -n | tail -n 3 | tr '\n' '+' | sed 's/+$//g' | awk '{ print "echo $((" $0 "))" }' | sh
