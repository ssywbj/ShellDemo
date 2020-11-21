#!/bin/bash

result=$(echo "$1" | bc)
echo "calc result: $result"

#result=$(awk 'BEGIN{print '$1'}')
#echo "calc result: $result"
