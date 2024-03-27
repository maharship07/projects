#!/bin/bash

echo Enter the word:
read W

grep -o -i $W myexamfile.txt|wc -l

