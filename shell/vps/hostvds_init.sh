#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/vps/hostvds_init.sh" | /bin/bash

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
echo root:@Best1216^78#9#@ | chpasswd

#ls & ll
echo "alias ls='ls \$LS_OPTIONS --color'" >> /root/.bashrc
echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /root/.bashrc

#启动ssr
systemctl stop shadowsocks-libev
systemctl disable shadowsocks-libev
nohup ss-server -s 0.0.0.0 -p 19986 -k mimabujiandan -m aes-128-gcm -t 300 -d 8.8.8.8,8.8.4.4 > /var/log/shadowsocks.log 2>&1 &

#添加防火墙
curl -fsSL 'http://www.qics.top/shell/ufw/ufw_hostvds.sh' | /bin/bash
echo "0 */1 * * * curl -fsSL 'http://www.qics.top/shell/ufw/ufw_hostvds.sh' | /bin/bash" >> /var/spool/cron/crontabs/root
#屏蔽暴力破解
echo "*/1 * * * * curl -fsSL 'http://www.qics.top/shell/blockip.sh' | /bin/bash" >> /var/spool/cron/crontabs/root

#启动定时任务
chmod 600 /var/spool/cron/crontabs/root
/etc/init.d/cron restart

#安装docker并启动
curl -fsSL https://get.docker.com | bash -s docker
service docker start
systemctl enable docker
service docker restart
docker login -u=qics -p Best12167
docker buildx create --name mutibuilder
docker buildx use mutibuilder
docker buildx inspect --bootstrap

docker run -d --restart=always -p 9000:80 -v /tmp:/etc/nginx/html --privileged=true qics/nginx
docker run -d --restart=always -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 --net=host --privileged=true qics/netbird
docker run -d --restart=always -e API_KEY=LAdoeJAuaq_uB2kCblxZDtF5wJFrDYHQfSHOFge0 -e ZONE=qics.top -e SUBDOMAIN=hostvds qics/ddns
docker run -d --restart=always qics/traffmonetizer start accept --token 5xijhElDM8IqEwMj0VolDEVsbUDCGS3GFpRCFckxix8=
docker run -d --restart=always --name proxy_hostvds_ssh_59022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=proxy_hostvds_ssh_59022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=59022 --network host qics/frp:client
docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp qics/debian

