#!/bin/bash 

userid=$(id -u)
r=\e[31m
g=\e[32m
y=\e[33m
n=\e[0m
logfolder="var/log/sheelscript-log"
scriptname= echo $0 | cut -d "." -f1
logfile=$logfolder/$logfile

mkdir -p  $logfolder
apps=( "mysql" "nginx" "python" "httpd" )

if [ $userid -ne 0 ]
then 
    echo -e "$r Error: $n run with root user" | tee -a $logfile
    exit 1
else
    echo -e  "running with root user" &>> $logfile
fi

validate(){
    if [ $1 -eq 0 ]
    then 
     echo "$2 installed $g successfully $n"
    else 
        echo "$2 installation $r falied $n"
    fi
}

for app in ${apps[@]} 
do 
    dnf list installed $app
    if [  $? -ne 0 ]
    then 
        echo "installing $app" 
        dnf install $app -y &>> $logfile
fi
        validate $? $app
    else 
        echo "$app already installed"
    fi    
done

dnf list installed nginx
if [ $? -eq 0 ]
then
    echo "$y nginx already installed $n"
else
    echo "installing mysql"
    dfn install nginx -y
    status=$?
    validate $status "nginx"
fi