echo -e "\e[33m Install redis repo\e[0m"
yum install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>>/tmp/roboshop.log

echo -e "\e[33m enable redis 6 version\e[0m
yum module enable redis:remi-6.2 -y  &>>/tmp/roboshop.log

echo -e "\e[33m Install redis\e[0m"

yum install redis -y   &>>/tmp/roboshop.log
sed -i 's/127.0.0.1/0.0.0.0' /etc/redis.conf  /etc/redis/redis.conf

echo -e "\e[33m Restart redis\e[0m"
systemctl enable redis  &>>/tmp/roboshop.log
systemctl start redis    &>>/tmp/roboshop.log