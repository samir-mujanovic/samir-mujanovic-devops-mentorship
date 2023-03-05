#!/bin/bash
# iterating trough multiple directories

for file in /root/--week-3/* /root/--week-3/badtest
do
        if [ -d "$file" ]
        then
                echo "$file is a directory"
        elif [ -f "$file" ]
        then
                echo "$file is a file"
        else
                echo "$file doesn't exist"
        fi
done