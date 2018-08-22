#!/bin/bash

echo expose ports
firewall-cmd --zone=public --add-port=2375/tcp --permanent
firewall-cmd --reload

echo add config
mkdir /etc/systemd/system/docker.service.d
echo [Service] > /etc/systemd/system/docker.service.d/docker-external.conf
echo ExecStart= >> /etc/systemd/system/docker.service.d/docker-external.conf
echo ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock >> /etc/systemd/system/docker.service.d/docker-external.conf

echo restart
systemctl daemon-reload
systemctl restart docker

