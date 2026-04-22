#!/bin/bash

USERID=$(id -u)
TIMESTAP=$(date +%F-%H-%M-%S)
SCRIPTNAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPTNAME-$TIMESTAP.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
y="\e[33m"

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$R $2 ... failure $N"
        exit 1
    else
        echo -e "$G $2 ... sucsess $N"
}

CHECKROOT(){
if [ $USERID -ne 0 ]
then
    echo -e "$R please run inside the root user $N"
    exit 1
else
    echo -e  "$G you are in root user $N"
fi
}

