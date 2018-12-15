#!/bin/bash

# configure node.js repo
#sudo apt-get install curl python-software-properties
sudo apt-get install curl python-software-properties -y
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
#curl -sL https://deb.nodesource.com/setup_7.x | sudo -E bash -
# install node.js
#apt install n
sudo apt-get install -y nodejs 
#sudo apt-get install -y build-essential

sudo apt-get install npm -y

#sudo vim /etc/systemd/system/my-webapp.service

# create systemd service
#cat > /etc/systemd/system/nodejs.service <<'EOF'

#[Unit]
#Description=Node.js App

#curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# install node.js
#apt install nodejs -y

# create systemd service
#cat > /etc/systemd/system/nodejs.service <<'EOF'
cat > /etc/init/nodejs.conf <<'EOF'
description "node.js server"
author      "Foo Bar"

# used to be: start on startup
# until we found some mounts weren't ready yet while booting

start on started mountall
stop on shutdown

# automatically respawn

respawn
respawn limit 99 5

script
chdir /var/www/nodejs
exec /usr/bin/npm run start:dev  /var/www/nodejs/app.js >> /var/log/node.log 2>&1

end script

post-start script

   # optionally put a script here that will notifiy you node has (re)started
   # /root/bin/hoptoad.sh "node.js has started!"

end script

EOF



# reload systemd services
#systemctl daemon-reload
#systemctl enable nodejs.service

# remove old directory
rm -rf /var/www/nodejs

# create directory node.js app
mkdir -p /var/www/nodejs
