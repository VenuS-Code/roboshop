echo -e "\e[36m >>> Installing NodeJS rpm<<<\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash
echo -e "\e[36m >>> Installing NodeJS<<<\e[0m"
yum install nodejs -y
echo -e "\e[36m >>> Adding robodhop user<<<\e[0m"
useradd roboshop
echo -e "\e[36m >>> Creating a Directory<<<\e[0m"
mkdir /app
echo -e "\e[36m >>> Downloading application code<<<\e[0m"
curl -L -o /tmp/cart.zip https://roboshop-artifacts.s3.amazonaws.com/cart.zip
cd /app
echo -e "\e[36m >>> Unzip the application code<<<\e[0m"
unzip /tmp/cart.zip
cd /app
echo -e "\e[36m >>> Installing NPM<<<\e[0m"
npm install
echo -e "\e[36m >>> Adding cart.service to systemd<<<\e[0m"
cp /home/centos/roboshop/cart.service /etc/systemd/system/cart.service
systemctl daemon-reload
echo -e "\e[36m >>> Start and enable the cart service<<<\e[0m"
systemctl enable cart
systemctl start cart