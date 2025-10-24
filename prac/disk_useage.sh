#!/bin/bash

disk=$(df -hT | grep -v Filesystem)
ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4) #too get the private ip of 
                                                                #the server


while IFS= read line
do 
    useage=$(echo $line| awk  '{print $6F}' | cut -d "%" -f1) 
    partions=$(echo $line|awk  '{print $7F}')
    if [ $useage -gt 1 ]
    then 
        echo -e "\e[33m $partions\e[0m disk useahge is greater than threshold \e[31m $useage \e[0m of system $ip"
    fi
done <<< $disk