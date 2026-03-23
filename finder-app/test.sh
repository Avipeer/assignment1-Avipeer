#!/bin/bash

#filesdir=/home/vboxuser/yes
filesdir=$1
searchstr="yes"
count_folders=$(find $filesdir -mindepth 1 -not -name ".*.sw*" -type f | wc -l)
echo "$count_folders"
echo $(grep -r "$searchstr" "$filesdir" | wc -l) 