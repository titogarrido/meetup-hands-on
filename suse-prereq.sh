#!/bin/bash

sudo zypper install -y --type pattern Basis-Devel
sudo zypper install -y libopenssl-devel

HL_FABRIC_VERSION="hlfv11"

# Execute nvm installation script
echo "# Executing nvm installation script"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# Set up nvm environment without restarting the shell
export NVM_DIR="${HOME}/.nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && . "${NVM_DIR}/nvm.sh"
[ -s "${NVM_DIR}/bash_completion" ] && . "${NVM_DIR}/bash_completion"

# Install node
echo "# Installing nodeJS"
nvm install --lts

# Install the latest version of npm
echo "# Installing npm"
npm install npm@latest -g

# Add docker privileges

sudo usermod -aG docker $(whoami)

# Docker compose

sudo easy_install pip

sudo pip install docker-compose==1.13

# Installing Golang
cd /tmp
wget --no-check-certificate https://storage.googleapis.com/golang/go1.9.3.linux-s390x.tar.gz
tar -xvf go1.9.3.linux-s390x.tar.gz
sudo mv -iv go /opt
cd ~/
cp -ipv .bashrc .bashrc_orig
echo export GOPATH=/home/$USER/git >> .bashrc
echo export GOROOT=/opt/go >> .bashrc
echo export PATH=/opt/go/bin:/home/$USER/bin:\$PATH >> .bashrc
echo export FABRIC_VERSION=hlfv11 >> .bashrc

# Installing composer
npm install -g composer-cli@0.19
npm install -g composer-rest-server@0.19
npm install -g generator-hyperledger-composer@0.19
npm install -g yo
npm install -g composer-playground@0.19

# Add firewall rules
sudo iptables -i eth0 -I INPUT -p tcp --dport 3000 -j ACCEPT
sudo iptables -i eth0 -I INPUT -p tcp --dport 4200 -j ACCEPT
sudo iptables -i eth0 -I INPUT -p tcp --dport 8080 -j ACCEPT
sudo iptables-save > ~/iptables.save

# Fetch some utils
mkdir ~/fabric-tools && cd ~/fabric-tools
curl -O https://raw.githubusercontent.com/hyperledger/composer-tools/master/packages/fabric-dev-servers/fabric-dev-servers.tar.gz
tar xzf fabric-dev-servers.tar.gz

# Print installation details for user
echo ''
echo 'Installation completed, versions installed are:'
echo ''
echo -n 'Node:           '
node --version
echo -n 'npm:            '
npm --version
echo -n 'Docker:         '
docker --version
echo -n 'Docker Compose: '
docker-compose --version
echo -n 'Python:         '
python -V
echo -n 'Hyperledger Composer:         '
composer --version
