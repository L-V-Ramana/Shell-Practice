#!/bin/bash

ami_id=ami-09c813fb71547fc4f
sg_id=sg-0eccd877a911ed1e3

aws ec2 run-instances \
    --image-id $ami_id \
    --count 1 \
    --instance-type t2.micro \
    --security-groups $sg_id \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyInstance}]'
