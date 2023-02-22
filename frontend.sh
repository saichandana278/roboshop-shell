echo -e "\e[35mInstalling ngnix\e[0m"
yum install nginx -y

echo -e "\e[35mRemoving old content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[35mDownloading frontend content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip

echo -e "\e[35mExtracting downloaded frontend content\e[0m"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[35mcoping Ngnix config for Roboshop\e[0m"
cp configs/ngnix-roboshop.conf /etc/nginx/default.d/roboshop.conf

echo -e "\e[35mEnabling ngnix\e[0m"
systemctl enable nginx

echo -e "\e[35mstarting ngnix\e[0m"
systemctl start nginx
