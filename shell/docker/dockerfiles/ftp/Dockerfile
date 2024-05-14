# docker buildx build -t ghcr.io/qicongsheng/ftp:server --platform linux/amd64,linux/arm64/v8 . --push
# =================================
# docker run -d --restart=always -e USERS="root|Best12167" -e ADDRESS=0.0.0.0 -p 9021:21 --privileged=true ghcr.io/qicongsheng/ftp:server
# =================================
FROM delfer/alpine-ftp-server
MAINTAINER qicongsheng

ENV ADDRESS=0.0.0.0
