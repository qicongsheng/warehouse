#!/bin/sh

systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install epel-release
yum -y install python-pip docker
service docker start

