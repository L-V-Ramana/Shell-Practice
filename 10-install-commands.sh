#!/bin/bash

userid=$(id -u)

if [ $userid -ne 0 ]
then 
      echo "error: access denied, please run the script with root access "
      exit 1 #give exit code as 1 to 127 other than 0 because 0 exit code means previos command is success
else
     echo " script is running by root user"
fi

dnf installed list mysql
if [ $? -ne 0 ]
then
    echo "dnf mysql is not yet installed, installing now"
    dnf install mysql -y

    if [ $? -eq 0 ]
    then  
    echo "mysql installed successfully"
    else
    echo "mysql installtion falied "
    exit 1
    fi

else
echo "mysql is already installed"
fi

# dnf install mysql -y

# if [ $? -eq 0 ]
# then  
#     echo "mysql installed successfully"
# else
#     echo "mysql installtion falied "
#     exit 1
# fi