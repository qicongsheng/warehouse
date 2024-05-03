# docker buildx build --platform linux/amd64,linux/arm64 -t ghcr.io/qicongsheng/nginx . --push
# =================================
# docker run -d --restart=always -p 9000:80 --privileged=true -v /tmp:/etc/nginx/html ghcr.io/qicongsheng/nginx
# =================================
FROM nginx:1.23.4-alpine-slim
MAINTAINER qicongsheng

ADD nginx.conf /etc/nginx
