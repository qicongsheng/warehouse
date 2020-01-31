#!/bin/sh

#关闭防火墙并安装shadowsocks
systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install epel-release
yum install python-pip -y
pip install youtube-dl
pip install shadowsocks

#安装docker并启动文件服务器
yum -y install docker
service docker start
docker run -d -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx

