# docker buildx build --build-arg FRP_VERSION=0.52.3 --platform linux/amd64,linux/arm64 -t qics/nginx . --push
FROM nginx:stable-alpine-slim
MAINTAINER qics

ADD nginx.conf /etc/nginx
