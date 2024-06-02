#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/vps/lenovo_init.sh" | /bin/bash

#setup
apt-get update
apt-get install ufw curl wget telnet dnsutils cron nload htop cpu-checker -y
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
curl -fsSL "https://www.qics.top/shell/docker/common/docker_login.sh" | /bin/sh
# curl -fsSL "https://www.qics.top/shell/docker_set_proxy.sh" | /bin/bash
# service docker restart

docker run -d --restart=always --name=nginx -p 9000:80 --privileged=true -v /tmp:/etc/nginx/html ghcr.nju.edu.cn/qicongsheng/nginx
docker run -d --restart=always -e API_KEY=LAdoeJAuaq_uB2kCblxZDtF5wJFrDYHQfSHOFge0 -e ZONE=qics.top -e SUBDOMAIN=home ghcr.nju.edu.cn/qicongsheng/ddns
docker run -d --restart=always --name=mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=youarebadboy123# -v /data/mysql:/var/lib/mysql ghcr.nju.edu.cn/qicongsheng/mysql:5.7
docker run -d --restart=always --name=vaultwarden -p 6068:80 -e SIGNUPS_ALLOWED=false -v /data/vaultwarden:/data ghcr.nju.edu.cn/qicongsheng/vaultwarden
docker run -d --restart=always --name=nexus -p 8081:8081 -v /data/nexus:/nexus-data ghcr.nju.edu.cn/qicongsheng/nexus
docker run -d --restart=always --name=jellyfin -p 8096:8096 --privileged=true -v /data/jellyfin:/data ghcr.nju.edu.cn/qicongsheng/jellyfin
docker run -d --restart=always --name=qinglong -p 5700:5700 -v /data/qinglong:/ql/data ghcr.nju.edu.cn/qicongsheng/qinglong
docker run -d --restart=always --name=cloudflared --net=host ghcr.nju.edu.cn/qicongsheng/cloudflared tunnel --no-autoupdate run --token eyJhIjoiZTAwMWM4MzlmMTNiNzU2ZDc0YWI1NjE0MzFlM2ZlZDciLCJ0IjoiNmY2ZjM4Y2EtODI0YS00MzhlLWI3MjctMzIwNTQ0ODRlYzRjIiwicyI6IlltWTBabUV4WW1FdE1ETTNNQzAwWVRsa0xUZzVNemN0TWprM01UQmtPRFZsTVdZMCJ9
docker run -d --restart=always --name=pickstar -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:8022:22 -p 8082:8082 --privileged=true -v /tmp:/tmp ghcr.nju.edu.cn/qicongsheng/pickstar
docker run -d --restart=always --name=backup -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:3022:22 --privileged=true -v /data:/data ghcr.nju.edu.cn/qicongsheng/backup:tencent
docker run -d --restart=always --name=debian -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:9022:22 --privileged=true -v /tmp:/tmp ghcr.nju.edu.cn/qicongsheng/debian


docker run -d --restart=always --name lenovo_ssh_20088 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_ssh_20088 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=10088 -e REMOTE_PORT=20088 --net=host ghcr.nju.edu.cn/qicongsheng/frp:client
docker run -d --restart=always --name lenovo_mysql_23306 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_mysql_23306 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=3306 -e REMOTE_PORT=23306 --net=host ghcr.nju.edu.cn/qicongsheng/frp:client
docker run -d --restart=always --name lenovo_ssh_29022 -e SERVER_ADDR=play.qics.top -e PROXY_NAME=lenovo_ssh_29022 -e SERVER_PORT=7000 -e TOKEN=badboy -e LOCAL_PORT=9022 -e REMOTE_PORT=29022 --net=host ghcr.nju.edu.cn/qicongsheng/frp:client


# curl -fsSL "https://www.qics.top/shell/docker_remove_proxy.sh" | /bin/bash

