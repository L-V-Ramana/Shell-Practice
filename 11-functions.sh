#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then
    echo "login with sudo user"
else
    echo "you are running with sudo access"
fi

validate(){
    
    if [ $1 -eq 0 ]
    then 
        echo " $2 is installing....success"
    else 
        echo " $2 is installing failed"
    fi
}

dnf list installed mysql

if [ $? -ne 0 ]
then 
    echo "installing mysql"
    dfn install mysql -y
    validate $? "mysql"
else 
    echo "already installed "mysql""
fi 

dnf list installed nginx

if [ $? -ne 0 ]
then 
 echo "installing nginx"
 dnf install nginx -y 
 validate $? "nginx"
else
 echo "nginx already installed"
fi

dnf list installed pytho3
if [ $? -ne 0 ]
then 
    echo "insatlling python3"
    dnf install python3 -y 
    validate $? python3
else
    echo "already installed"
fi