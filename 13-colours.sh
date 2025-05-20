#!/bin/bash

userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
b="\e[34m"
n="\e[0m]"

if [ $userid -ne 0 ]
then 
    echo -e "$rerror :$n login with sudo user"
    exit 1
else
    echo " you are running with root access"
fi

validate(){
    
    if [ $1 -eq 0 ]
    then 
        echo -e " $2 is installing.... $gsuccess$n"
    else 
        echo -e " $2 is installing...$rfailed$n"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "installing mysql"
    dfn install mysql -y
    validate $? "mysql"
else 
    echo "already installed $ymysql$n""
fi 

dnf list installed nginx

if [ $? -ne 0 ]
then 
    echo "installing nginx"
    dnf install nginx -y 
    validate $? "nginx"
else
 echo "nginx already $yinstalled$n"
fi

dnf list installed pytho3
if [ $? -ne 0 ]
then 
    echo "insatlling python3"
    dnf install python3 -y 
    validate $? python3
else
    echo "already installed...$ypython3$n"
fi