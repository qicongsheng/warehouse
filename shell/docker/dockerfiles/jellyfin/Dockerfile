# docker buildx build -t ghcr.io/qicongsheng/jellyfin --platform linux/amd64,linux/arm64/v8 . --push
# docker run -d --restart=always --name=jellyfin -p 8096:8096 --privileged=true -v /tmp:/tmp ghcr.io/qicongsheng/jellyfin
FROM jellyfin/jellyfin
MAINTAINER qicongsheng

RUN apt update && apt install fonts-noto-cjk-extra -y \
    && mkdir /data && chmod -R 777 /data





