#!/bin/bash

apt-get install openssh-server -y
cp /etc/ssh/sshd_config /etc/ssh/sshd_config_minakim
sed -i "s/\#Port 22/Port 65000/" /etc/ssh/sshd_config
service ssh restart
