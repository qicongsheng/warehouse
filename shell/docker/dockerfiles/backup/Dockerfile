# docker buildx build -t ghcr.io/qicongsheng/backup --platform linux/amd64,linux/arm64/v8 . --push
FROM ghcr.io/qicongsheng/debian:latest
MAINTAINER qicongsheng

RUN echo "curl -fsSL http://www.qics.top/shell/docker/dockerfiles/backup/backup.sh | /bin/bash" >> /opt/addon/backup.sh


