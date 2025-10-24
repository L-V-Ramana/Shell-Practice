#!/bin/bash

disk= $(df -hT | grep -v Filesystem)
ip=$(curl http://169.254.169.254/latest/meta-data/local-ipv4) #too get the private ip of 
                                                                #the server


while IFS= read -r line
do 
   useage= $line|awk -f " " '{PRINT $6F}'|cut -d "%" f1
    partions= $line|awk -f " " '{PRINT $7F}'
    if [ $useage -gt 70 ]
    then 
        echo $partions disk useahge is greater than threshold $useage of system $ip
    fi
done <<< $disk