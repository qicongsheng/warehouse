# docker buildx build -t ghcr.io/qicongsheng/backup --platform linux/amd64,linux/arm64/v8 . --push
# =================================
# docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:3022:22 --privileged=true -v /data:/data ghcr.io/qicongsheng/backup
# =================================
FROM ghcr.io/qicongsheng/debian:latest
MAINTAINER qicongsheng

RUN mkdir /opt/addon && echo "curl -fsSL http://www.qics.top/shell/docker/dockerfiles/backup/backup_crontab_init.sh | /bin/bash" >> /opt/addon/backup.sh


