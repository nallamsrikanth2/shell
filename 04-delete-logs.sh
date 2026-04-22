#!/bin/bash

SOURCE_DIRECTORY=/tmp/applogs

VALIDATE(){
    if [ $? -ne 0 ]
    then
        echo -e "$R $2... Failure $N"
        exit 1
    else
        echo -e " $G $2 ... suces $Ns"
    fi
}

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

 if [ -d $SOURCE_DIRECTORY ]
 then
    echo -e "$G source directory exists $N"
else
    echo -e " $R please make sure directory exists $N"
    exit 1
fi


FILES=$(find $SOURCE_DIRECTORY -name "*.log" -mtime +14)

while  IFS= read -r line
do
echo "delete files... $line"
rm -rf $line
VALIDATE $? "removing files sucessfully"
done <<< $FILES
