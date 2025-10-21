#!/bin/bash 
# logs backing up

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DATE=${3:-14}

if [ $# -lt 2 ]
then 
    useage
    exit 1

    if [ ! -d $SOURCE_DIR ]
    then
        echo -e " $R Error $N No source directory $SOURCE_DIR"
    fi

    if [ ! -d $DEST_DIR  ]
    then
        echo -e "$R Error $N No destination directory $DEST_DIR"
    fi
fi

files=$(find $SOURCE_DIR -name "*.log" -mtime +$DATE)

if [ ! -z $files ]
then 
    timestamp=$(date+f-%h-%m-%s)
    echo $timestamp
    filename="$DEST_DIR/$timestamp.zip"
    echo $filename
    find $SOURCE_DIR -name "*.log" -mtime +$DATE|zip -@ $filename

    if [ -f $filename ]
    then 
        echo -e "Succesfully files zipped"
        
        while ISF= read -r files
        do
            echo -e "$G $file is being removed $N"
            rm -rf $files
        done <<< $files
    else
        echo -e "cration of zip is failed"
    fi
fi



useage(){

    echo -e " $R sh <script-name> <source-dir> <dest-dir> <days>(optional) $N "
}