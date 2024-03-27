#!/bin/sh
echo Enter the name of the person whose records you want to find:
read name
echo "Name; Address; Phone number"
grep -i $name book.txt
