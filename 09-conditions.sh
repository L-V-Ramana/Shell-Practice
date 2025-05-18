#!/bin/bash

number=$1

# -gt = greater than 
#  -lt  = less than
#  -eq = equal
#  -ne = not equal

if [ $number -lt 10 ]
then 
    echo "given $number is less than 10"
else
    echo "given $number is grester than 10"
fi