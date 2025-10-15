user=$(id -u) 

if [ $user -eq 0]
then    
    dnf install nginx -y 
    validate $? "nginx"
else
    echo "login as root user"
    exit 1 # we can give upto 1 to 127 because 0 is only return code for success
fi

dnf list insatlled mysql

if [ $? -eq 0 ]
then 
    echo "mysql is already installed"
    exit 1
else
    echo "installing mysql"
    dnf install mysql -y
        if [ $? -eq 0 ]
        then
            echo "installing mysql is success"
        else
            echo "intaltion of mysql is failed"
        fi
fi
   
    
validate(){
    if [ $1 -eq 0 ]
    then
        echo "$2 instalation is successfull"
    else    
        echo "$2 instalation is falies"
        exit 1
    fi
}

#colours
echo -e "\e[31m ramana lella is a good boy \e[0m"

