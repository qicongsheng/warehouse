#!/bin/sh

#关闭防火墙并安装shadowsocks
systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install epel-release python-pip
pip install youtube-dl

#安装docker并启动文件服务器
yum -y install docker
service docker start

