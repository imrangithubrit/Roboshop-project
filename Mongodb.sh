#copy repo file 
echo -e "\e[33m Copy Mongo repo file\e[0m"
cp Mongodb.repo /etc/yum.repos.d/mongodb.repo  &>>/tmp/roboshop.log
 
echo -e "\e[33m Installing the mongodb\e[0m"
yum install mongodb-org -y   &>>/tmp/roboshop.log

echo -e "\e[33m Uodated mongodb.repo\e[0m"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf


echo -e "\e[33m Starting the mongodb\e[0m"
systemctl enable mongod  &>>/tmp/roboshop.log

systemctl restart mongod  &>>/tmp/roboshop.log