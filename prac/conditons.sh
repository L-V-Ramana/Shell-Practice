#!/bin/bash

echo "conditions if and else"

number=10
number2=10
if ( $number -lt 10)
then
echo "given number is less than 10"
else
echo "given number is greater than 10"
fi

if ( $number -gt 10)
then
echo "given number is greater than 10"
else
echo "given number is less than 10"
fi

if ( $number -eq 10)
then
echo "given equal is equal than 10"
else
echo "given number is not than 10"
fi

if ( $number -nq 10)
then
echo "given notequal is notequal than 10"
else
echo "given equal is equal than 10"
fi