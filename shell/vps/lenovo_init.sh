#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/vps/lenovo_init.sh" | /bin/bash

#setup
apt-get update
apt-get install ufw curl wget telnet dnsutils cron nload htop cpu-checker -y
mkdir -p /var/spool/cron/crontabs

#设置时区
echo 'export TZ=Asia/Shanghai' >> /etc/profile
echo 'export LANG=zh_CN.UTF-8' >> /etc/profile
echo 'source /etc/profile' >> ~/.bash_profile
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
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
# curl -fsSL "https://www.qics.top/shell/docker_set_proxy.sh" | /bin/bash
# service docker restart

docker run -d --restart=always --name=nginx -p 9000:80 --privileged=true -v /tmp:/etc/nginx/html registry.cn-hangzhou.aliyuncs.com/qics/nginx
docker run -d --restart=always --name=jellyfin -p 8096:8096 --privileged=true -v /data/jellyfin:/data registry.cn-hangzhou.aliyuncs.com/qics/jellyfin
docker run -d --restart=always --name=nexus -p 8081:8081 -v /data/nexus:/nexus-data registry.cn-hangzhou.aliyuncs.com/qics/nexus
docker run -d --restart=always --name=ddns -e API_KEY=LAdoeJAuaq_uB2kCblxZDtF5wJFrDYHQfSHOFge0 -e ZONE=qics.top -e SUBDOMAIN=home registry.cn-hangzhou.aliyuncs.com/qics/ddns
docker run -d --restart=always --name=mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123# -v /data/mysql:/var/lib/mysql registry.cn-hangzhou.aliyuncs.com/qics/mysql:5.7
docker run -d --restart=always --name=rabbitmq --net=host registry.cn-hangzhou.aliyuncs.com/qics/sc:rabbitmq
docker run -d --restart=always --name=redis -e REDIS_PASSWORD=Lhnekj#_83jf -p 6379:6379 registry.cn-hangzhou.aliyuncs.com/qics/sc:redis /bin/sh -c 'redis-server --appendonly yes --requirepass ${REDIS_PASSWORD}'
docker run -d --restart=always --name=cloudflared --net=host registry.cn-hangzhou.aliyuncs.com/qics/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiNmY2ZjM4Y2EtODI0YS00MzhlLWI3MjctMzIwNTQ0ODRlYzRjIiwicyI6IlltWTBabUV4WW1FdE1ETTNNQzAwWVRsa0xUZzVNemN0TWprM01UQmtPRFZsTVdZMCJ9
docker run -d --restart=always --name=netbird -e NB_SETUP_KEY=951ABD0D-6D3D-47BB-AD78-A8F5D26F5DA7 --net=host --privileged=true registry.cn-hangzhou.aliyuncs.com/qics/netbird
docker run -d --restart=always --name lenovo_ssh_20088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_ssh_20088 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=10088 -e REMOTE_PORT=20088 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name lenovo_ssh_28022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_ssh_28022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=8022 -e REMOTE_PORT=28022 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name lenovo_ssh_29022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_ssh_29022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=29022 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name lenovo_nexus_8081 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_nexus_8081 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=8081 -e REMOTE_PORT=8081 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name lenovo_pn_28096 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_jellyfin_28096 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=8096 -e REMOTE_PORT=28096 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name lenovo_mysql_23306 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_mysql_23306 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=3306 -e REMOTE_PORT=23306 --net=host registry.cn-hangzhou.aliyuncs.com/qics/frp:client
docker run -d --restart=always --name=pickstar -e USER=root -e PASSWD=Star8ks.# -p 8022:22 -p 8082:8082 --privileged=true -v /tmp:/tmp registry.cn-hangzhou.aliyuncs.com/qics/pickstar
docker run -d --restart=always --name=debian -e USER=root -e PASSWD=Star8ks.# -p 9022:22 --privileged=true -v /tmp:/tmp registry.cn-hangzhou.aliyuncs.com/qics/debian

# curl -fsSL "https://www.qics.top/shell/docker_remove_proxy.sh" | /bin/bash

# apt install ntfs-3g
# fdisk -l
# mount /dev/sdc1 /mnt/ssd
# umount /mnt/ssd
