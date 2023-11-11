FROM qics/test:gui
MAINTAINER qics

USER root

ENV USER=root \
    PASSWD=123456 \
    TZ=Asia/Shanghai 

ENV VNC_PW=$PASSWD

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y openssh-client openssh-server curl \
    && mkdir /var/run/sshd/ && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo "alias ls='ls \$LS_OPTIONS --color'" >> /root/.bashrc \
    && echo "alias ll='ls \$LS_OPTIONS -l --color'" >> /root/.bashrc \
    
    && mv /etc/apt/sources.list.d/debian.sources /etc/apt/sources.list.d/debian.sources.bak \
    && curl -o /etc/apt/sources.list.d/ali-debian12.sources https://www.qics.top/shell/debian/sources/ali-debian12.sources \
    
    && echo '#!/bin/bash' >> /opt/startup.sh \
    && echo 'echo "user: $USER" ' >> /opt/startup.sh \
    && echo 'echo "passwd: $PASSWD" ' >> /opt/startup.sh \
    && echo 'useradd $USER' >> /opt/startup.sh \
    && echo 'echo $USER:$PASSWD | chpasswd' >> /opt/startup.sh \
    && echo '/usr/sbin/sshd -D &' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \
    
    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

EXPOSE 22
CMD ["/opt/startup.sh"]