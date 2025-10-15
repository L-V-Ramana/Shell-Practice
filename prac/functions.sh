#!/bin/bash

validate(){
    if [$1 -eq 0] 
    then 
        echo "$2 installation is successful"
    else
        echo "$2 installation is failure"
    fi
}

user=(id-u)

validate(){
    if [ $1 -eq 0 ]
    then
        echo " $2 instalation is success"
    else
        echo " $2 instalation failed"
    fi
}

instalation(){
    dnf install $2
    validate S? $2
    # if [ $? -eq 0 ]
    # then 
    #     echo "installation of $2 is success"
    # else
    #     echo "installitaion of $2 is failed"
    # fi
}

dnf list installed mysql

if [ $? -eq 0 ] 
then 
    echo "mysql is already installed"
else
    echo "installing mysql"
    # dnf instsll mysql
    instalation $? "mysql"
fi 


person="ramana"
echo "${person}al"
person1=(${person})
echo "${person1}"

user=(id-u)

