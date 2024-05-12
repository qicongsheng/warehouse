# docker buildx build -t ghcr.io/qicongsheng/vaultwarden --platform linux/amd64,linux/arm64 . --push
# =================================
# mkdir -p /data/vaultwarden
# docker run -d --restart=always -e SIGNUPS_ALLOWED=false -p 6068:80 -v /data/vaultwarden:/data ghcr.io/qicongsheng/vaultwarden
# =================================
FROM vaultwarden/server:latest
MAINTAINER qicongsheng
