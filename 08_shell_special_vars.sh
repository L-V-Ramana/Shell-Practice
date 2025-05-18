#!bin/basf

echo "name of arguments passes to script: $@"
echo "number of argumm=ents passes to script: $#"
echo "to get running script name: $0 "
echo "to know present working directoy $PWD"
echo "to know the current user running the script : $USER"
echo "to know the home directory of the current script running user: $HOME"
echo "to know the process instance id of the current running script: $$"
sleep 20 &
echo "to know the procees instance id of the last command running in background: $!"
