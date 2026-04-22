source ./common.sh
CHECKROOT

dnf install nginx -y 
VALIDATE $? "install the nginx"

systemctl enable nginx
VALIDATE $? "enable nginx"

systemctl start nginx
VALIDATE $? "start the nginx"

rm -rf /usr/share/nginx/html/*
VALIDATE $? "remove everthing in html file"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
VALIDATE $? "download the code"

cd /usr/share/nginx/html
VALIDATE $? "move to html file"

unzip /tmp/frontend.zip
VALIDATE $? "unzip the code"

cp /home/ec2-user/shell/expense.conf  /etc/nginx/default.d/expense.conf
VALIDATE $? "copy the code"

systemctl restart nginx
VALIDATE $? "restart the nginx"

echo -e "$G frontend server is ready $N"
