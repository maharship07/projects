#!/bin/sh
echo Provide the name of the person whose record you want to delete:
read name
sed -i '/$name/d' book.txt
