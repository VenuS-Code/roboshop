echo -e "\e[36m >>>>> Installing maven \e[0m"
yum install maven -y
echo -e "\e[36m >>>>> Adding user roboshop \e[0m"
useradd roboshop
echo -e "\e[36m >>>>> Creating a directory \e[0m"
mkdir /app
echo -e "\e[36m >>>>> Downloading Application code \e[0m"
curl -L -o /tmp/shipping.zip https://roboshop-artifacts.s3.amazonaws.com/shipping.zip
cd /app
echo -e "\e[36m >>>>> Unzip the code \e[0m"
unzip /tmp/shipping.zip
cd /app
mvn clean package
echo -e "\e[36m >>>>> moving the code to respective directory \e[0m"
mv target/shipping-1.0.jar shipping.jar
echo -e "\e[36m >>>>> copying shipping service to systemd \e[0m"
cp /home/centos/roboshop/shipping.service /etc/systemd/system/shipping.service
systemctl daemon-reload
echo -e "\e[36m >>>>> enable and start shipping service \e[0m"
systemctl enable shipping
systemctl start shipping
echo -e "\e[36m >>>>> Installing mysql \e[0m"
yum install mysql -y
mysql -h mysql.devopsbeginner.online -uroot -pRoboShop@1 < /app/schema/shipping.sql
systemctl restart shipping


