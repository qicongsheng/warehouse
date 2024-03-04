# docker build -t qics/playdocker .
FROM python:3.9-alpine
MAINTAINER qics

RUN apk add --no-cache curl \
    && pip3 install pip --upgrade  \
    && pip3 install paramiko loguru selenium \
    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'curl -fsSL "https://www.qics.top/shell/docker/dockerfiles/playdocker/playdocker.sh" | /bin/sh' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]
