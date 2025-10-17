#!/bin/bash
r="\e[31m"
g="\e[32m"
y="\e[33m"
n="\e[0m"

user=$(id -u)
packages=("mysql" "nginx")
if [ $user -ne 0 ]
then
    echo -e "$r ERROR!: log on as root user $n"|tee -a $logfile
    exit 1
else
    echo -e "$g you are logged as root user $n"| tee -a $logfile
fi

log_directory=/var/log/shell-script
mkdir -p $log_directory
scriptName=$0|cut -d "." -f1
logfile="${log_directory}/${scriptName}.log"


validate(){
    if [ $1 -eq 0 ]
    then    
        echo -e "$g $2 installaiton is success $n"|tee -a $logfile
    else
        echo -e "$r $2 installation is failed $n"| tee -a $logfile
        exit 1
    fi 
}

     

for i in ${packages[@]}
do
    dnf list installed $i &>> $logfile
    if [ $? -ne 0 ]
    then 
    echo -e "$g installing $i $n"| tee -a $logfile
        dnf install $i -y &>>$logfile
        validate $? $i
        
    else
        echo -e "$y $i already installed$n"|tee -a $logfile
        exit 1
    fi
done

# dnf list installed mysql &>>$logfile



# dnf list installed nginx &>>$logfile

# if [ $? -eq 0 ]
# then 
#     echo -e "$y nginx already installed $n"
#     exit 1
# else
#     echo -e "$g installing nginx $n"
#     dnf install nginx -y &>>$logfile
#     validate $? "nginx"
# fi



