#!/bin/bash

#epidof $process
>swap.list
arr=$(ps aux | awk '{print $2}')
for i in ${arr[*]}
do  
swap=`grep --color VmSwap /proc/$i/status 2>/dev/null | awk '{print $2}'`
	if [ $swap > 0 ]
	then
		pr_name=`ps aux | grep $i | awk '{print $11}'` 
		echo "pid: "$i  "   swap:" $swap  "  name: "$pr_name| sort
		echo $swap >> swap.list
 
	fi
	
done
sum=`awk '{s+=$1} END {print s}' swap.list`
echo "=========================="
echo "SWAP USAGE SUM IS $sum kb"

