#copy repo file 
echo -e "\e[33m Copy Mongo repo file\e[0m"
cp Mongodb.repo /etc/yum.repos.d/mongodb.repo  
 
echo -e "\e[33m Installing the mongodb\e[0m"
yum install mongodb-org -y 

echo -e "\e[33m Starting the mongodb\e[0m"
systemctl enable mongod 

systemctl restart mongod