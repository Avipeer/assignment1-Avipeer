#!/bin/bash

filesdir=$1
searchstr=$2

#check if 2 arguments were passed
if ! [ $# -eq 2 ]
then
    #if an arguemnt is not passed it's an empry str
    #-z checks if the string len is 0(empty str)
    if [ -z $filesdir ]
    then
    echo "arg1 filesdir is missing!"
    fi
    if [ -z $searchstr]
    then
    echo "arg2 searchstr is missing!"
    fi
    exit 1
fi
#checks if the path in filesdir exists
if ! [ -e "$filesdir" ]
then
    echo "Error!given path does not exist!"
    exit 1
fi

#use find to search for all directories, wc -l counts the number of paths found
#X is the amount of folders and subfolders in the path
X=$(find $filesdir -mindepth 1 -not -name ".*.sw*" -type f | wc -l)
Y=$(grep -r $searchstr $filesdir | wc -l) 
echo  "The number of files are ${X} and the number of matching lines are ${Y}" 