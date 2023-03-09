#!/bin/bash
# read file and create ISNERT statements for mySQL

outfile='members.sql'
IFS=','
while read lname fname address city state zip
do
        cat >> $outfile << EOF
        INSERT INTO members (lname,fname,address,city,state,zip) VALUES ('$lname', '$fname', '$addres', '$city', '$state', '$zip');
EOF
done < ${1}