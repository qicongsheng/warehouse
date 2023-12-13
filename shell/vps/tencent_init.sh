#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/vps/tencent_init.sh" | /bin/bash

#setup
apt-get update
apt-get install ufw curl wget telnet dnsutils cron nload htop -y
mkdir -p /var/spool/cron/crontabs

#设置时区
echo "export TZ=Asia/Shanghai" >> /etc/profile
source /etc/profile

#修改远程登录端口(22->10088)
echo '' >> /etc/ssh/sshd_config
echo 'Port 10088' >> /etc/ssh/sshd_config
systemctl restart sshd.service

#修改root密码
echo root:@Best1216^78#9#@ | chpasswd

#ls & ll
echo "alias ls='ls \$LS_OPTIONS --color'" >> /root/.bashrc
echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /root/.bashrc

#安装docker并启动文件服务器
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
service docker start
systemctl enable docker
service docker restart
docker login -u=qics -p Best12167
docker run -d --restart=always -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --restart=always --net host --cap-add=NET_ADMIN -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 qics/netbird
docker run -d --restart=always -e HOST=0.0.0.0 -e PORT=8066 --net host qics/shellngn
docker run -d --restart=always -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123#  qics/mysql:5.7
docker run -d --restart=always -e BIND_PORT=7000 -e DASHBOARD_PORT=7777 -e DASHBOARD_USER=qics -e DASHBOARD_PWD=123456 -e TOKEN=badboy --network host qics/frp:server
docker run -d --restart=always --net host qics/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiMTNjYmI4OTYtNjdkZS00NmY1LTkxOGEtZGE0YjA3NDNjMGE3IiwicyI6IlpUUTJaVGhpWXpjdE9HTXhZeTAwTm1OaUxXSmtZbU10TVRnd1lUZzVOelk0WldKaiJ9
docker run -d --restart=always -p 8088:8978 qics/cloudbeaver
docker run -d --restart=always -e PASSWORD=mimabujiandan -e SERVER_ADDR=127.0.0.1 -e SERVER_PORT=49986 -e METHOD=aes-128-gcm -p 1080:1080 -p 1080:1080/udp --network host -d qics/shadowsocks:client
docker run -d --restart=always -e FORWARD_IP=127.0.0.1 -e FORWARD_PORT=1080 --cap-add NET_ADMIN --network host -p 8118:8118 -p 8118:8118/udp qics/privoxy
docker run -d --restart=always -p 15672:15672 -p 5672:5672 qics/sc:rabbitmq
docker run -d --restart=always -e REDIS_PASSWORD=Lhnekj#_83jf -p 6379:6379 qics/sc:redis /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
docker run -d --restart=always -p 8081:8081 -p 8520:8520 qics/nexus:dev
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:8022:22 -p 8082:8082 --privileged=true -v /tmp:/tmp qics/pickstar
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:6022:22 --privileged=true -v /tmp:/tmp qics/kali
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian

#添加防火墙
curl -fsSL 'http://www.qics.top/shell/ufw/ufw_tencent.sh' | /bin/bash
echo "0 */1 * * * curl -fsSL 'http://www.qics.top/shell/ufw/ufw_tencent.sh' | /bin/bash" >> /var/spool/cron/crontabs/root
#屏蔽暴力破解
echo "*/1 * * * * curl -fsSL 'http://www.qics.top/shell/blockip.sh' | /bin/bash" >> /var/spool/cron/crontabs/root

#启动定时任务
chmod 600 /var/spool/cron/crontabs/root
/etc/init.d/cron restart
