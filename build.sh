#!/bin/bash

echo WARNING! Need docker and docker compose to work. This script will attempt to isntall and configure it if it doesnt exist. This is for Centos7

read -p "Press enter to continue"


echo "installing docker"
yum install curl -y
yum install docker -y
systemctl start docker 
systemctl status docker
systemctl enable docker
sudo curl -L https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "installing wget"
yum install wget -y

echo Creating the necessary directories for jenkins and sonarqube
mkdir -p /docker/data/sonarqube/
mkdir /docker/data/sonarqube/sonarqube_conf
mkdir /docker/data/sonarqube/sonarqube_data
mkdir /docker/data/sonarqube/sonarqube_extensions
mkdir /docker/data/sonarqube/sonarqube_bundled-plugins
mkdir -p /docker/data/postgres/postgresql
mkdir /docker/data/postgres/postgresql_data
mkdir /docker/data/jenkins/
mkdir -p /nginx/data/

echo Move over files there
mv * /docker/
cd /docker/
wget https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip

echo "Open firewall"
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --zone=public --add-port=443/tcp --permanent
firewall-cmd --reload

echo Start the docker containers
docker-compose up -d

echo Getting nginx companion containers
git clone https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion.git
cd docker-compose-letsencrypt-nginx-proxy-companion/
cp .env.sample .env
mkdir -p /nginx/data

echo Please follow the below config to start up all of the containers with their ssl certs
echo Change the nginx data path
echo Remove the logging stuff in the docker compose file
echo Put privileged: true by all containers
echo Run ./start to start and wait a minutechange the nginx data path

