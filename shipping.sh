yum install maven -y
useradd roboshop
rm -rf /app
mkdir /app
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
unzip /tmp/shipping.zip
cp /home/centos/roboshop/shipping.service /etc/systemd/system/shipping.service
systemctl daemon-reload
systemctl enable shipping
systemctl start shipping
yum install mysql -y
mysql -h mysql.devopsbeginner.online -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping
