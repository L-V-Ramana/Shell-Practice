#!/bin/bash

source ./common.sh
appname=catalogue

checkUser
appSetup
nodejsSetup
systemSetup

cp $PWD/mongo.repo /etc/yum.repos.d/monggo.repo
validate $? copying mongorepo
dnf install mongodb-mongosh -y
validate $? insatlling mongorepo