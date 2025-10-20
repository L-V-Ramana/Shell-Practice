#!/bin/bash
start_time=$(date+%s)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
log_directory="/var/log/roboshop"
scriptname="$(echo $0|cut -d "." -f1)"
logfile="$log_directory/$scriptname.log"

mkdir -p $log_directory

echo "script started excutution at $(date)"| tee -a $logfile

checkUser(){
    user=$(id -u)

    if [ $user -ne 0 ]
    then    
        echo -e "$R no login, login as root user $N" | tee -a $logfile
    else    
        echo -e " $G success looged in as root user $N" | tee -a $logfile
    fi
}

validate(){

    if [ $? -eq 0 ] 
    then 
        echo -e "$G $2 is success $N"|tee -a $logfile
    else    
        echo -e "$R $2 is falied $N"| tee -a $logfile
        exit 1
    fi
}
appSetup(){
    id roboshop
    if [ $? -ne 0 ]
    then
        usedadd --system --home /app --shell /sbin/nologin --comment "roboshop system user" roboshop &>>$logfile
        validate $? "creting system user"  
    else
        echo -e "roboshop user already exists $Y Skipping $N" | tee -a $logfile
    fi
    mkdir -p /app &>>$logfile
    curl -L -o /tmp/$appname.zip https://roboshop-artifacts.s3.amazonaws.com/$appname-v3.zip &>>$logfile
    cd /app &>>$logfile
    rm -rf /app/* &>>$logfile
    validate $? "cleaning /app"
    unzip /tmp/$appname.zip &>>$log &>>$logfile
    validate $? "unziping $appname"

}

javaSetup(){
    dnf install maven -y &>>$logfile
    validate $? "installing maven"
    mvn clean package &>>$logfile
    mv target/shipping-1.0.jar shipping.jar &>>$logfile
}

nodejsSetup(){
    dnf module disable nodejs -y &>>$logfile
    validate $? "disabling nodejs"

    dnf module enable nodejs:20 -y &>>$logfile
    validate $? "enabling node js 20"

    dnf install nodejs -y &>>$logfile
    validate $? "insatalling nodejs"
    cd /app

    npm install &>>$logfile
    validate $? "npm install" 
}

systemSetup(){
    cp $PWD/$appname.repo /etc/systemd/system/$appname.repo
    validate $? "copying systemd "

    systemctl daemon-reload &>>$logfile
    validate $? "daemon-reload"

    systemctl enable $appname &>>$logfile
    validate $? "enabling $1"

    systemctl start $appname &>>$logfile
    validate $? "starting $1"
}

printTime(){
    endtime=$(date+%s)
    totaltime=$(($endtime-$start_time))

    echo "excuted time -$totaltime"

}