#!/bin/bash

r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"
log_directory=var/log/shell-script
scriptname= $(echo $0|cut -d "." f1)
logfile="$log_directory/$scriptname.log"
user=$(id -u)

mkdir -p $log_directory

if [ $user -ne 0]
then
    echo -e "$r Error $n, login as root user" | tee -a $logfile
    exit 1
else
    echo -e "$g your are rooy user $n"| tee -a $logfile
fi
cp $PWD/mongo.repo /etc/yum.repos.d/mongd

dnf install mongodb-org -y &>>$logfile
validate $? "mongodb instalation"

systemctl enable mongod  &>>$logfile
validate $? "enabling mongodb" 
    
systemctl start mongod  &>>$logfile
validate $? "starting mongodb"

cp $PWD/mongo.repo /etc/mongod.conf  &>>$logfile
validate $? "copying"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>>$logfile
validate $? "editing port"

systemctl restart mongod
validate $? "restaring mongodb "
 
validate(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$r $2 is unsuccessfull$n" | tee -a $logfile
        exit 1
    else
        echo -e "$g  is successful $n" | tee -a $logfile
    fi

}