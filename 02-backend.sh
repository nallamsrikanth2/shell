source ./common.sh

CHECKROOT

dnf module disable nodejs -y
VALIDATE $? "disable nodejs"

dnf module enable nodejs:20 -y
VALIDATE $? "enable nodejs"

dnf install nodejs -y
VALIDATE $? "install nodejs"

id expense
if [ $? -ne 0 ]
then
    useradd expense
else
    echo -e "$Y user created successfully $N"
fi

mkdir -p /app
VALIDATE $? "create the app"

curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
VALIDATE $? "download the code"

cd /app
VALIDATE $? "move to app"

rm -rf /app/*
VALIDATE $? "remove the everything in app"

cd /app

npm install
VALIDATE $? "install the dependies"

cp /home/ec2-user/shell/backend.service  /etc/systemd/system/backend.service
VALIDATE $? "download the code"

systemctl daemon-reload
VALIDATE $? "reload the sevice"

systemctl start backend
VALIDATE $? "start the backend"

systemctl enable backend
VALIDATE $? "enable the backend"

