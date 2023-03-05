#!/bin/bash
#iterate trough all the files in directory
for file in /root/--week-3/*
do
        if [ -d "$file" ]
        then
                echo "$file is a directory"
        elif [ -f "$file" ]
        then
                echo "$file is a file"
        fi
done