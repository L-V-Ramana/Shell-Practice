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
        echo " $2 is installing is success"
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