# docker buildx build -t qics/playdocker --platform linux/amd64,linux/arm64/v8 . --push
FROM python:3.9-alpine
MAINTAINER qics

RUN apk add --no-cache curl \
    && pip install pip --upgrade  \
    && pip install paramiko loguru selenium \
    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker.sh" | /bin/sh' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]
