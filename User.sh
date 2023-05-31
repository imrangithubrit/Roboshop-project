

echo -e "\e[33m Configuration Nodejs Repos\e[0m"

curl -sL https://rpm.nodesource.com/setup_lts.x | bash &>>/tmp/roboshop.log

echo -e "\e[33m Installing Nodejs\e[0m"
yum install nodejs -y   &>>/tmp/roboshop.log

echo -e "\e[33m Add Application User\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

echo -e "\e[33m Creating application directory\e[0m"
rm -rf /app  &>>/tmp/roboshop.log
mkdir /app 

echo -e "\e[33m Download Application content\e[0m"
curl -L -o /tmp/user.zip https://roboshop-artifacts.s3.amazonaws.com/user.zip  &>>/tmp/roboshop.log
cd /app 

echo -e "\e[33m Extract Application content\e[0m"
unzip /tmp/user.zip  &>>/tmp/roboshop.log

cd /app 

echo -e "\e[33m Install Nodejs Dependencies\e[0m"
npm install  &>>/tmp/roboshop.log

echo -e "\e[33m Setup systemD services\e[0m"
cp /root/Roboshop-project/User.service /etc/systemd/system/User.service  &>>/tmp/roboshop.log

echo -e "\e[33m Start User service\e[0m"
systemctl daemon-reload &>>/tmp/roboshop.log

systemctl enable user  &>>/tmp/roboshop.log
systemctl restart user &>>/tmp/roboshop.log


echo -e "\e[33m Copy Mongo db service\e[0m"
cp /root/Roboshop-project/Mongodb.repo /etc/yum.repos.d/mongodb.repo   &>>/tmp/roboshop.log

echo -e "\e[33m install Mongodb\e[0m"
yum install mongodb-org-shell -y  &>>/tmp/roboshop.log

echo -e "\e[33m Load schema\e[0m"
mongo --host mongodb-dev.devopsb72.store </app/schema/user.js  &>>/tmp/roboshop.log