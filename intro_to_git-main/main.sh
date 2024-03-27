#!/bin/sh
exit=0

while($exit -ne 1)
        do
	echo 
        echo -e "add, find, delete, exit: "
        read entry

        if("$entry" = "add")
        then
                sh add.sh

        elif("$entry" = "find")
        then
                sh find.sh

        elif("$entry" = "delete")
        then
                sh delete.sh

        elif("$entry" = "exit")
        then
                exit=1
