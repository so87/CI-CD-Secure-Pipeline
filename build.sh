#!/bin/bash

echo WARNING! Need docker and docker compose installed in order to work
read -p "Press enter to continue"


echo Creating the necessary directories for jenkins and sonarqube
mkdir -p /docker/data/sonarqube/
mkdir /docker/data/sonarqube/sonarqube_conf
mkdir /docker/data/sonarqube/sonarqube_data
mkdir /docker/data/sonarqube/sonarqube_extensions
mkdir /docker/data/sonarqube/sonarqube_bundled-plugins
mkdir -p /docker/data/postgres/postgresql
mkdir /docker/data/postgres/postgresql_data
mkdir /docker/data/jenkins/

echo Move over files there
mv build.sh /docker/
mv docker-compose.yml /docker/
mv postgres /docker/
mv sonarqube /docker/
mv jenkins /docker/
cd /docker/

echo Start the docker containers
docker-compose up
