#!/bin/bash

userid=$(id -u)

if [ $userid -eq 0 ]
then 
    echo " script is running by root user"
else
    echo "error: access denied, please run the script with root access "
fi
