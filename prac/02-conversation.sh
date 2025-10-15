#!/bin/bash

# person1=musk
# person2=trump
person1=$1
person2=$2
echo "$person1: hi $person2, how are you"
echo "$person2: hi $person1 what about your mars trip"
echo "$person1: yes i will be going $person2, will you join"
echo "$person2: no i am busy"

echo "enter your pin"
read -s pin
echo "your pin is ${pin}"

echo "enter your code"
read code
echo "your code is ${code}"

number1=100
number2=200

sum=$((${number1}+${number2}))

echo "sum of number1 and number2 is ${sum}"

today=$(date)
echo "todays date is ${today}"

subjects=("math" "social" "english")

echo "1st subject ${subjects[0]}"
echo "2nd subject ${subjects[1]}"
echo "3rd subject ${subjects[2]}"

echo "all subjects $subjects[@]"

number=10
if [ ${number} -lt 10 ]
then
    echo "$number is less than 10"
else
    if [ $number -gt 10 ]
    then
        echo "$number is greater than 10"
    else
        echo "$number is equal to 10"
    fi
fi


