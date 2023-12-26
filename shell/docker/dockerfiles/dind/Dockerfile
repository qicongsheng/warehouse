# docker buildx build -t qics/dind --platform linux/amd64,linux/arm64/v8 . --push
FROM docker:dind
MAINTAINER qics

ENV USER=root \
    PASSWD=123456 \
    TZ=Asia/Shanghai

RUN apk update \
    && apk add sudo openssh-client openssh-server curl \
    && mkdir /var/run/sshd/  \
    && ssh-keygen -A \
    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /root/.bashrc \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /root/.bashrc \

    && echo 'echo "user: $USER" ' >> /usr/local/bin/docker-entrypoint.sh \
    && echo 'echo "passwd: $PASSWD" ' >> /usr/local/bin/docker-entrypoint.sh \
    && echo 'adduser --shell /bin/sh --disabled-password --gecos "" $USER' >> /usr/local/bin/docker-entrypoint.sh \
    && echo 'echo "$USER:$PASSWD" | chpasswd' >> /usr/local/bin/docker-entrypoint.sh \
    && echo '/usr/sbin/sshd -D &' >> /usr/local/bin/docker-entrypoint.sh \
    && echo 'tail -f /dev/null' >> /usr/local/bin/docker-entrypoint.sh \

    && rm -fr /tmp/*

EXPOSE 22


