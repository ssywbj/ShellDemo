#!/bin/bash

echo "请输入算术式子："
read arith_expr 
result=$(echo "$arith_expr" | bc)
echo "calc result: $result"

#result=$(awk 'BEGIN{print '$arith_expr'}')
#echo "calc result: $result"
