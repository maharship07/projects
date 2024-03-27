#!/bin/bash

echo Enter number of days:
read N
find ~ -iname "*" -atime +$N -type f | zip compress -@

