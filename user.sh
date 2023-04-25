echo -e "\e[35m >>>>> Downloading  Node Js repo file <<<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[35m >>>>> Installing Node Js <<<<<\e[0m"
yum install nodejs -y
echo -e "\e[35m >>>>> Adding a user roboshop <<<<<\e[0m"
useradd roboshop
echo -e "\e[35m >>>>> Creating a directory <<<<<\e[0m"
mkdir /app
echo -e "\e[35m >>>>> Downloading  App code to /app directory <<<<<\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip
cd /app
echo -e "\e[35m >>>>> unzip the code <<<<<\e[0m"
unzip /tmp/user.zip
cd /app
echo -e "\e[35m >>>>> Installing npm tools <<<<<\e[0m"
npm install
echo -e "\e[35m >>>>> configure the user.service <<<<<\e[0m"
cp /home/centos/Roboshop-shell/user.service /etc/systemd/system/user.service
systemctl daemon-reload
systemctl enable user
systemctl start user
cp /home/centos/Roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[35m >>>>> Installing mongodb <<<<<\e[0m"
yum install mongodb-org-shell -y
mongo --host mongodb.devopsbeginner.online </app/schema/user.js

