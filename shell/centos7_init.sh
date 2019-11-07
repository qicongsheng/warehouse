#!/bin/sh

#关闭防火墙并安装shadowsocks
systemctl stop firewalld.service
systemctl disable firewalld.service
yum -y install epel-release
yum install python-pip -y
pip install youtube-dl
pip install shadowsocks
ssserver -p 19986 -k mimabujiandan -m rc4-md5 -d start

#安装docker并启动文件服务器
yum -y install docker
service docker start
docker run -d -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx

#修改远程登录端口(22->10088)
echo 'Port 10088' >> /etc/ssh/sshd_config
systemctl start firewalld.service
firewall-cmd --zone=public --add-port=10088/tcp --permanent
firewall-cmd --reload
firewall-cmd --zone=public --query-port=10088/tcp
semanage port -a -t ssh_port_t -p tcp 10088
semanage port -l | grep ssh
systemctl restart sshd.service
systemctl stop firewalld.service

#修改root密码
echo @Best1216789@ | passwd --stdin root

#常用开发环境
yum install python-devel zlib-devel openssl-devel -y
yum install https://centos7.iuscommunity.org/ius-release.rpm -y
yum install python36u python36u-libs python36u-devel python36u-pip -y 
ln -s /usr/bin/python3.6 /usr/bin/python3
ln -s /usr/bin/pip3.6 /usr/bin/pip3


