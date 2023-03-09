#!/bin/bash
# creating a temp file in /temp

tempfile=$(mktemp -t tmp.XXXXXX)

echo "This is a test file" > $tempfile
echo "This is the scond line of the test." >> $tempfile

echo "The temp file is located at: $tempfile"
cat $tempfile
rm -f $tempfile