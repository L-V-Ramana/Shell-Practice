#/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
user=$(id -u)
sourceDir=home/ec2-user/app-logs



if [$user -ne 0]
then 
    echo -e "$R Error $N login as root user"
    exit 1
else
    echo "$G Success $N, root user"
fi

files=$(find $sourceDir -name "*.logs" -mtime+14)


while  ISF=read -r files 
do
    echo "deleting files as $files"
    rm -rf $files
done <<< $files
