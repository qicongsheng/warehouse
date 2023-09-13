#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/vps/vultr_init.sh" | /bin/bash

#设置dns服务器
echo "nameserver 8.8.8.8" > /etc/resolv.conf

#setup
apt-get update
apt-get install ufw curl wget telnet dnsutils cron nload htop shadowsocks-libev -y
mkdir -p /var/spool/cron/crontabs

#设置时区
echo "export TZ=Asia/Shanghai" >> /etc/profile
source /etc/profile

#修改远程登录端口(22->10088)
echo '' >> /etc/ssh/sshd_config
echo 'Port 10088' >> /etc/ssh/sshd_config
systemctl restart sshd.service

#修改root密码
echo root:@Best121^6789#@ | chpasswd

#ls & ll
echo "alias ls='ls \$LS_OPTIONS --color'" >> /root/.bashrc
echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /root/.bashrc

#启动ssr
systemctl stop shadowsocks-libev
systemctl disable shadowsocks-libev
nohup ss-server -s 0.0.0.0 -p 19986 -k mimabujiandan -m aes-128-gcm -t 300 -d 8.8.8.8,8.8.4.4 > /var/log/shadowsocks.log 2>&1 &

#安装docker并启动文件服务器
curl -fsSL https://get.docker.com | bash -s docker 
service docker start
systemctl enable docker
service docker restart
docker run -d --restart=always -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --restart=always -e BIND_PORT=7000 -e DASHBOARD_PORT=7777 -e DASHBOARD_USER=qics -e DASHBOARD_PWD=123456 -e TOKEN=badboy --network host qics/frp:server
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks# -p 8022:22 --privileged=true -v /tmp:/tmp qics/debian

#屏蔽暴力破解
echo "*/1 * * * * curl -fsSL 'http://www.qics.top/shell/blockip.sh' | /bin/bash" >> /var/spool/cron/crontabs/root

#添加防火墙
curl -fsSL 'http://www.qics.top/shell/ufw/ufw_hostvds.sh' | /bin/bash
echo "0 */1 * * * curl -fsSL 'http://www.qics.top/shell/ufw/ufw_hostvds.sh' | /bin/bash >> /var/log/ufw_edit.log 2>&1" >> /var/spool/cron/crontabs/root

#启动定时任务
chmod 600 /var/spool/cron/crontabs/root
/etc/init.d/cron restart
