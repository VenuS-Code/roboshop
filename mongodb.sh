echo -e "\e[36m >>>> copy mongo.repo <<<<<\e[0m"
cp /home/centos/roboshop/mongo.repo /etc/yum.repos.d/mongo.repo
echo -e "\e[36m >>>>Installation mongodb <<<<<\e[0m"
yum install mongodb-org -y
echo -e "\e[36m >>>> enable and start mongod services <<<<<\e[0m"
systemctl enable mongod
systemctl start mongod
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/mongod.conf
systemctl restart mongod
