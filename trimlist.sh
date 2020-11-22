#!/bin/bash -e

#Usage: trimlist sectors offset

listLimit=8
sectors=$1
pos=$2
while [ $sectors -gt 0 ] ; do
	if test $sectors -gt $listLimit; then
		size=$listLimit
	else
		size=$sectors
	fi
	echo "$pos:$size"
	sectors=$(($sectors-$size))
	pos=$(($pos+$size))
done

