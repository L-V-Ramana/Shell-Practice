#!/bin/bash
apps=("insta" "facebook" "telegram" "whatsapp")
echo "elemetnt at 0 ${apps[0]}"

echo "using install commands"
echo "in shell even if the code fails the next line excutes"

user=$(id -u)

if [ $user -eq 0 ] 
then
    echo "you are running as a root user"
else
    echo "error, please login as a root usere"
    exit 1
fi

dnf list installed mysql

if [ $? -eq 0 ] 
then
    echo "mysql is already installed"
    exit 1
else
    echo "installing mysql"
    exit 1
    dnf install mysql
    if [ $? -eq 0]
    then
        echo "mysql instalation completed" 
    else
        echo "failed mysql installation"
        exit 1
    fi 
fi