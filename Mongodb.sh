#copy repo file 
echo -e "\e[33m Copy Mongo repo file\e[0m"
cp Mongodb.repo /etc/yum.repos.d/mongodb.repo  &>>/tmp/roboshop.log
 
echo -e "\e[33m Installing the mongodb\e[0m"
yum install mongodb-org -y   &>>/tmp/roboshop.log

echo -e "\e[33m Starting the mongodb\e[0m"
systemctl enable mongod  &>>/tmp/roboshop.log

systemctl restart mongod  &>>/tmp/roboshop.log