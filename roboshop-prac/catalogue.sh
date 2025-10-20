#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
log_directory=/var/log/roboshop
scriptname="echo $0|cut -d "." -f1"
logfile="${log_directory}/${scriptname}.log"

mkdir -p ${log_directory}

user=$(id -u)

if [$user -ne 0]
then 
    echo -e "$R ERROR!,log in as root user$N"|tee -a $logfile
else    
    echo -e "$G you are logged as root user$N"|tee -a $logfile
fi

validate(){
    
    if [ $1 -ne 0]
    then
        echo -e "$R $2 is failerd, try again$N"| tee -a $logfile
}

dnf module disable nodejs -y &>>$logfile
validate $? "disabling node js"

dnf enable nodejs:20 -y
validate $? "enabling node js 20" &>> $logfile

dnf install nodejs -y &>>$logfile
validate $? "installing nodejs"

$USER

if [ $? -ne 0 ]
then
    useradd --system --home /app -shell /sbin/nologin -comment "robodhop system -user" roboshop
    validate $? 
else 
    echo -e "already running as system user $Y skippinf $N"|tee -a $logfile
fi

mkdir -p /app
validate $? "creating app directory"

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip 
cd /app 
rm -rf /app/*
validate $? "removing content"

unzip /tmp/catalogue.zip  &>>$logfile
validate $? "downloading, unzipping app"

npm install &>>$logfile
validate $? "installing app"

cp $PWD/catalogue.sh /etc/systemd/system/catalogue.services
validate $? "copoying the servicefile"

systemctl daemon-reload &>>$logfile
validate $? "daemon reload"

systemctl enable catalogue  &>>$logfile
systemctl start catalogue &>>$logfile
validate $? "system enable start"

cp $PWD/mongo.repo /etc/yum.repos.d/mongo.repo
validate $? "copying mongo.repo"

dnf install mongodb-mongosh -y  &>>$logfile
validate $? "install mongodb"

STATUS=$(mongosh --host mongodb.daws84s.site --eval 'db.getMongo().getDBNames().indexOf("catalogue")')  &>>$logfile
if [ $STATUS -lt 0]
then
    mongosh --host mongodb.ramana.site </app/db/master-data.js
    validate $? "data load"

else 
    echo -e "$Y data is already loaded $N"|n tee -a $logfile
fi
