#!/bin/bash

# configure node.js repo
#sudo apt-get install curl python-software-properties
sudo apt-get install curl python-software-properties
#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
# install node.js
#apt install n
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

sudo apt-get install npm

#sudo vim /etc/systemd/system/my-webapp.service

# create systemd service
#cat > /etc/systemd/system/nodejs.service <<'EOF'

#[Unit]
#Description=Node.js App

#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# install node.js
#apt install nodejs -y

# create systemd service
cat > /etc/systemd/system/nodejs.service <<'EOF'
#cat > /etc/init/nodejs.service <<'EOF'
[Unit]
Description=Node.js App
After=network.target
[Service]
User=nobody
WorkingDirectory=/var/www/NodeJS
Et=/usr/bin/npm run start:dev
Restart=always
RestartSec=500ms
StartLimitInterval=0
[Install]
WantedBy=multi-user.target
EOF



# reload systemd services
#systemctl daemon-reload
#systemctl enable nodejs.service
service enable daemon-reload
service enable nodejs.service

# remove old directory
rm -rf /var/www/NodeJS

# create directory node.js app
mkdir -p /var/www/NodeJS
