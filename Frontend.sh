
echo -e "\e[33m Installing the nginx\e[0m"
yum install nginx -y >/tmp/roboshop.log

 
echo -e "\e[33m Removing the old App content\e[0m"
rm -rf /usr/share/nginx/html/*  >/tmp/roboshop.log

 echo -e "\e[33m Downloading the Frontend\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip  >/tmp/roboshop.log

echo -e "\e[33m Extract Frontend content\e[0m"
cd /usr/share/nginx/html 
unzip /tmp/frontend.zip >/tmp/roboshop.log

echo -e "\e[33m Starting Nginx server\e[0m"
systemctl enable nginx >/tmp/roboshop.log
systemctl restart nginx >/tmp/roboshop.log






