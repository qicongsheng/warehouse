# docker buildx build -t ghcr.io/qicongsheng/registryui --platform linux/amd64,linux/arm64/v8 . --push
# =================================
# docker run -d --restart=always -p 8001:8000 ghcr.io/qicongsheng/registryui
# =================================
FROM quiq/registry-ui
MAINTAINER qicongsheng

ADD config.yml /opt
