#!/bin/bash
#file
sudo apt update

#preparing for installation vs code

sudo apt-get install -y curl wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg

#installation vs code

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

#installation Docker
#Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

#Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#Installing GihHub CLI

(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
&& sudo mkdir -p -m 755 /etc/apt/keyrings \
&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
&& sudo apt update \
&& sudo apt install gh -y

#Installing YC

curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash

Installing Terraform from Yandex mirror
sudo apt-get install unzip
wget https://hashicorp-releases.yandexcloud.net/terraform/1.9.5/terraform_1.9.5_linux_amd64.zip
unzip terraform*_linux_amd64.zip
sudo mv terraform /usr/local/bin/
sudo rm LICENSE.txt
sudo rm terraform*linux_amd64.zip

#Installing MC
sudo apt install -y mc

Installing Packer Yandex mirror
wget https://hashicorp-releases.yandexcloud.net/packer/1.11.2/packer_1.11.2_linux_amd64.zip
unzip packer*linux_amd64.zip
sudo mv packer /usr/local/bin
sudo rm LICENSE.txt
sudo rm packer*linux_amd64.zip

#Installing Telegram
sudo snap install telegram-desktop

#Installing Discord
sudo snap install discord

#Downloading Outline-Client
#sudo apt install libfuse2
#wget https://outline-vpn.com/download.php?os=c_linux
#sudo chmod ug+x 
