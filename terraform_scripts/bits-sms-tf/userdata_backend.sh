#!/usr/bin/bash
cd /home/ec2-user/
sudo yum update -y
sudo yum install python -y
mkdir webapp
cd webapp
sudo yum install wget zip git -y
git clone https://github.com/loki-geek/bits-sms.git
cd bits-sms/backend
python3 -m venv pyvenv
source pyvenv/bin/activate
pip install -r requirements.txt