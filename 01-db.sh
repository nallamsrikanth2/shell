source ./common.sh

CHECKROOT

dnf install mysql-server -y  &>>$LOGFILE
VALIDATE $? "installing mysql"

systemctl enable mysqld   &>>$LOGFILE
VALIDATE $? "enable the mysqld"

systemctl start mysqld   &>>$LOGFILE
VALIDATE $? "start the mysqld"

mysql -h db.nsrikanth.online -uroot -pExpenseApp@1 -e 'show databases;'  &>>$LOGFILE
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ExpenseApp@1 >>$LOGFILE
    VALIDATE $? "setup root password"
else
    echo -e "$Y root password already setup $N"
fi

echo -e "$G db server created successfully $N"