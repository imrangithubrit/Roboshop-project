
echo -e "\e[33m Install redis repo\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y

echo -e "\e[33m enable redis repo\e[0m"
yum module enable redis:remi-6.2 -y

echo -e "\e[33m Install redis repo\e[0m"
yum install redis -y 

sed -i 's/127.0.0.1/0.0.0.0/' /etc/redis.conf  /etc/redis/redis.conf

echo -e "\e[33m restart redis repo\e[0m"
systemctl enable redis 
systemctl start redis 