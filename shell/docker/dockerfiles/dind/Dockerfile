# docker buildx build -t qics/dind --platform linux/amd64,linux/arm64/v8 . --push
FROM qics/test:dind
MAINTAINER qics

ENV USER=root \
    PASSWD=123456 \
    SSH_PORT=22 \
    TZ=Asia/Shanghai

RUN apk update \
    && apk add sudo openssh-client openssh-server curl \
    && mkdir /var/run/sshd/  \
    && ssh-keygen -A \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /etc/profile \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /etc/profile \

    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'echo "passwd: $PASSWD" ' >> /opt/startup.sh \
    && echo 'echo "user: $USER" ' >> /opt/startup.sh \
    && echo 'echo "Port $SSH_PORT" >> /etc/ssh/sshd_config ' >> /opt/startup.sh \
    && echo 'adduser --shell /bin/sh --disabled-password --gecos "" $USER' >> /opt/startup.sh \
    && echo 'echo "$USER:$PASSWD" | chpasswd' >> /opt/startup.sh \
    && echo '/usr/sbin/sshd -D &' >> /opt/startup.sh \
    && echo '/usr/local/bin/dockerd-entrypoint.sh' >> /opt/startup.sh \



    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

EXPOSE 22

ENTRYPOINT ["/opt/startup.sh"]
