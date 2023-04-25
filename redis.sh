echo -e "\e[36m >>>>>>> Installing REMI <<<<<\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
echo -e "\e[36m >>>>>>> Using DNF to enable the versions <<<<<\e[0m"
dnf module enable redis:remi-6.2 -y
echo -e "\e[36m >>>>>>> Installing Redis <<<<<\e[0m"
yum install redis -y
echo -e "\e[36m >>>>>>> Update the listen address 127.0.0.1 to 0.0.0.0  /etc/redis.conf <<<<<\e[0m"
sed -i -e 's|127.0.0.1|0.0.0.0|' /etc/redis.conf /etc/redis/redis.conf
# Update the listen address 127.0.0.1 to 0.0.0.0  /etc/redis.conf
echo -e "\e[36m >>>>>>> Enable redis startup service  <<<<<\e[0m"
systemctl enable redis
echo -e "\e[36m >>>>>>> starting redis services <<<<<\e[0m"
systemctl start redis

