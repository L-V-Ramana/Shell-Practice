#!/bin/bash

userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
b="\e[34m"
n="\e[0m]"

if [ $userid -ne 0 ]
then 
    echo -e "$r error : $n login with sudo user"
    exit 1
else
    echo " you are running with root access"
fi

validate(){
    
    if [ $1 -eq 0 ]
    then 
        echo -e " $2 is installing.... $g success $n"
    else 
        echo -e " $2 is installing...$r failed $n"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "installing mysql"
    dfn install mysql -y
    validate $? "mysql"
else 
    echo -e " already installed $y mysql $n"
fi 

dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "installing nginx"
    dnf install nginx -y 
    validate $? "nginx"
else
    echo -e " nginx already $y installed $n "
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "insatlling python3"
    dnf install python3 -y 
    validate $? python3
else
    echo -e " already installed...$y python3 $n "
fi