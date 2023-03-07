#!/bin/bash
# testing parameter before use

if [ -n "$1" ]
then
        echo Hello $1, glat to meet you.
else
        echo "Sorry, you did not identify yourself. "
fi