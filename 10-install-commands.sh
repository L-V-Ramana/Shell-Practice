#!/bin/bash

userid=$(id -u)

if [ $userid -nq 0 ]
then 
      echo "error: access denied, please run the script with root access "
else
     echo " script is running by root user"
fi
