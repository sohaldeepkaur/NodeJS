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
#cat > /etc/systemd/system/nodejs.service <<'EOF'
cat > /etc/init/nodejs.conf <<'EOF'
description "anup Routing Server"
  start on runlevel [2345]
  stop on runlevel [!2345]
  respawn
  respawn limit 10 5
  # run as non privileged user 
  # add user with this command:
  ## adduser --system --ingroup www-data --home /opt/apache-tomcat apache-tomcat
  # Ubuntu 12.04: (use 'exec sudo -u apache-tomcat' when using 10.04)
  setuid root
  setgid root
  # adapt paths:
  cd /var/www/NodeJS
  exec /usr/bin/npm start:dev >> /home/ubuntu/logs/routing.log 2>&1
  # cleanup temp directory after stop
  post-stop script
    #rm -rf $CATALINA_HOME/temp/*
  end script
EOF



# reload systemd services
#systemctl daemon-reload
#systemctl enable nodejs.service

# remove old directory
rm -rf /var/www/NodeJS

# create directory node.js app
mkdir -p /var/www/NodeJS
