# docker buildx build -t ghcr.io/qicongsheng/playdocker --platform linux/amd64,linux/arm64/v8 . --push
FROM python:3.9-alpine
MAINTAINER qics

ARG TARGETARCH

RUN if [ "$TARGETARCH" = "arm64" ]; then \
      apk add gcc musl-dev libffi-dev; \
    fi \
    && apk add --no-cache curl \
    && pip install pip --upgrade \
    && pip install paramiko loguru selenium yagmail \
    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker.sh" | /bin/sh' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]
