#!/bin/sh

#安装依赖包
yum -y install epel-release
yum install python-pip firewall-config sysvinit-tools cronie -y

#关闭防火墙
systemctl stop firewalld.service
systemctl disable firewalld.service

#安装docker并启动文件服务器
yum -y install docker
service docker start
docker run -d -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx

#添加爆破ip屏蔽脚本
curl -o /usr/local/bin/blockip.sh https://www.qics.top/shell/blockip.sh
chmod +x /usr/local/bin/blockip.sh
echo "*/1 * * * * /usr/local/bin/blockip.sh" >> /var/spool/cron/root

#修改远程登录端口(22->10088)
echo '' >> /etc/ssh/sshd_config
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
echo Hhewi7@!#7._4 | passwd --stdin root

