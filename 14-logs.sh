#!/bin/bash

userid=$(id -u)
r="\e[31m"
g="\e[32m"
y="\e[33m"
b="\e[34m"
n="\e[0m]"

logsfolder= "var/log/shellscript-logs"
filename=$(echo $0|cut -d "." -f1)
logfile=$logsfolder/$filename
 mkdir -p $logsfolder

if [ $userid -ne 0 ]
then 
    echo -e "$r error : $n login with sudo user" &>>$logfile
    exit 1
else
    echo " you are running with root access"  &>>$logfile
    exit 1
fi

validate(){
    
    if [ $1 -eq 0 ]
    then 
        echo -e " $2 is installing.... $g success $n"  &>>$logfile
    exit 1
    else 
        echo -e " $2 is installing...$r failed $n"  &>>$logfile
    exit 1
    fi
}

dnf list installed mysql   &>>$logfile
    exit 1

if [ $? -ne 0 ]
then 
    echo "installing mysql" 
    dfn install mysql -y  &>>$logfile
    exit 1
    validate $? "mysql"
else 
    echo -e " already installed $y mysql $n"  &>>$logfile
    exit 1
fi 

dnf list installed nginx  &>>$logfile
    exit 1

if [ $? -ne 0 ]
then 
    echo "installing nginx"
    dnf install nginx -y   &>>$logfile
    exit 1
    validate $? "nginx"
else
    echo -e " nginx already $y installed $n "  &>>$logfile
    exit 1
fi

dnf list installed python3
if [ $? -ne 0 ]
then 
    echo "insatlling python3"
    dnf install python3 -y   &>>$logfile
    exit 1
    validate $? python3
else
    echo -e " already installed...$y python3 $n "  &>>$logfile
    exit 1
fi