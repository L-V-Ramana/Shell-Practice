#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "login with sudo user"
else
    echo "you are running with sudo access"
fi

validate(){
    
    if [ $1 eq 0 ]
    then 
        echo " $2 is installing"
    else 
        echo " $2 is not installing"
}