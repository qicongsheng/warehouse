# docker buildx build --platform linux/amd64,linux/arm64 -t qics/nginx . --push
FROM nginx:stable-alpine-slim
MAINTAINER qics

ADD https://www.qics.top/shell/docker/dockerfiles/nginx/nginx.conf /etc/nginx
