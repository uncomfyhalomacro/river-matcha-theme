#!/bin/sh
 
cmd=$1

if [ $cmd == "up" ]
then
	cur_tag=$(expr $2 - 1)
	if [ $cur_tag < 1 ]
	then
		riverctl set-focused-tags 256
	else
		tags=$(($cur_tag << ($cur_tag - 1)))
		riverctl set-focused-tags $tags
	fi
else
	cur_tag=$(expr $2 + 1)
	tags=$(($cur_tag << ($cur_tag - 1)))
	riverctl set-focused-tags $tags
fi

