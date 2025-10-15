#!/bin/bash

echo "special vars in shell"

echo "to get the current working directory $PWD"
echo "to know the current running user $USER"
echo "to know the status of previous commnad status $?"
echo "if $? values is return as 1 it is success remaining are failures"
echo "$# to get the count of number of args passed"
echo "PID of teh script$$"
echo "to get the name of the running script $0"
echo "to get the all the args passed to the script $@"
echo "to send the process to the background use & at the end of the
        command as in the below line"
sleep 10 &
echo "$! to get the pid of the command running in the background"