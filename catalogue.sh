
echo -e "\e[33m Configuration Nodejs Reps\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash  &>>/tmp/roboshop.log


echo -e "\e[33m Installation the nodejs\e[0m"
yum install nodejs -y  &>>/tmp/roboshop.log

echo -e "\e[33m Add Application user\e[0m"
useradd roboshop  &>>/tmp/roboshop.log

rm -rf /app &>>/tmp/roboshop.log
mkdir /app &>>/tmp/roboshop.log

echo -e "\e[33m Download Application content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip  &>>/tmp/roboshop.log
cd /app 

echo -e "\e[33m Extract Application content \e[0m"
unzip /tmp/catalogue.zip  &>>/tmp/roboshop.log
cd /app  &>>/tmp/roboshop.log
echo -e "\e[33m Install Nodejs Dependencies\e[0m"
npm install &>>/tmp/roboshop.log

echo -e "\e[33m setup systemd service\e [0m"
cp /root/Roboshop-project/catalogue.service /etc/systemd/system/catalogue.service  &>>/tmp/roboshop.log

echo -e "\e[33m start Catalogue service \e[0m"
systemctl daemon-reload  &>>/tmp/roboshop.log
systemctl enable catalogue  &>>/tmp/roboshop.log
systemctl restart catalogue &>>/tmp/roboshop.log

echo -e "\e[33m Copy Mongodb repo file\e[0m"
cp /root/Roboshop-project/Mongodb.repo /etc/yum.repos.d/mongo.repo  &>>/tmp/roboshop.log

echo -e "\e[33m Install Mongodb repo file\e[0m"
yum install mongodb-org-shell -y  &>>/tmp/roboshop.log

echo -e "\e[33m Load schema\e[0m"
mongo --host mongodb://mongodb-dev.devopsb72.store </app/schema/catalogue.js  &>>/tmp/roboshop.log