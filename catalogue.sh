
echo -e "\e[33m Configuration Nodejs Reps\e[0m"
curl -sL https://rpm.nodesource.com/setup_lts.x | bash


echo -e "\e[33m Installation the nodejs\e[0m"
yum install nodejs -y

echo -e "e\[33m Add Application user\e[0m"
useradd roboshop

rm -rf /app
mkdir /app

echo -e "\e[33m Download Application content\e[0m"
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue.zip 
cd /app 

echo -e "\e[33m Extract Application content \e[0m"
unzip /tmp/catalogue.zip
cd /app 
echo -e "\e[33m Install Nodejs Dependencies\e[0m"
npm install 

echo -e "\e[33m setup systemd service\e [0m"
cp catalogue.service /etc/systemd/system/catalogue.service

echo -e "\e[33m start Catalogue service \e[0m"
systemctl daemon-reload
systemctl enable catalogue 
systemctl restart catalogue

echo -e "\e[33m Copy Mongodb repo file\e[0m"
cp Mongodb.repo /etc/yum.repos.d/mongo.repo

echo -e "\e[33m Install Mongodb repo file\e[0m"
yum install mongodb-org-shell -y

echo -e "\e[33m Load schema\e[0m"
mongo --host mongodb://mongodb-dev.devopsb72.store </app/schema/catalogue.js