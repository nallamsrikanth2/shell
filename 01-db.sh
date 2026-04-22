source ./common.sh

CHECKROOT

dnf install mysql-server -y
VALIDATE $? "installing mysql"

systemctl enable mysqld
VALIDATE $? "enable the mysqld"

systemctl start mysqld
VALIDATE $? "start the mysqld"

mysql -h db.nsrikanth.online -uroot -pExpenseApp@1 -e 'showdatabases;'
if [ $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ExpenseApp@1
else
    echo -e "$Y root password already setup $N"
fi

echo -e "$G db sever created sucessfully $N"
