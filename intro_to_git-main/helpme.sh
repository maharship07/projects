#!/bin/bash
echo Type your command
read input

	if
		grep -q $input mandatabase.txt;
	then
		grep $input mandatabase.txt; #if found print the information related to that command.
	else
		echo Sorry, I cannot help you.
	fi
