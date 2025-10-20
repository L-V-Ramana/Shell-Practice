#/bin/bash

sourceDir="home/ec2-user/app-logs"
files=$(find $sourceDir -name "*.logs" -mtime+14)

while [ ISF = read -r $files ]
do
    echo "deleting files as $files"
    rm -rf
done <<< $files
