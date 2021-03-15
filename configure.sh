#!/bin/bash

if [ -f "run" ]; then
	exit 1
fi

apt update
apt install -y openssh-server

mkdir /root/.ssh
touch /root/.ssh/authorized_keys
echo "$SSH_KEY" > /root/.ssh/authorized_keys
cat /root/.ssh/authorized_keys

cp sshd_config /etc/ssh/sshd_config

#/usr/sbin/sshd -f /etc/ssh/sshd_config
systemctl start ssh.service

touch run

#amyyzm
