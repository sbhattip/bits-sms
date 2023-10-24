#!/usr/bin/bash
cd /home/ec2-user/
sudo yum update -y
mkdir webapp
cd webapp
sudo yum install wget zip git -y
git clone https://github.com/loki-geek/bits-sms.git
cd /home/ec2-user/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source .bashrc
nvm install v21.0.0
nvm use v21.0.0
cd webapp/bits-sms/frontend/
npm install