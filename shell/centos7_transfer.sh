#!/bin/sh

systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install epel-release
yum -y install python-pip docker
pip install youtube-dl

service docker start
docker run -d -e USER=root -e PASSWD=Best12167 -p 9022:22 -p 9023:5901 -p 9024:6901 --privileged=true -v /tmp:/tmp qics/centos7:vnc 


