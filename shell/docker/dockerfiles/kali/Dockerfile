# docker buildx build -t qics/kali --platform linux/amd64,linux/arm64/v8 . --push
FROM kalilinux/kali-rolling:latest
MAINTAINER qics

ENV USER=root \
	PASSWD=123456

RUN apt-get update && apt-get upgrade -y \
    && apt-get install vim net-tools pciutils aircrack-ng openssh-server kmod iputils-ping telnet nmap hashcat -y \

    && echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config \
    && echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config \

    && echo '#!/bin/bash' >> /opt/startup.sh \
    && echo 'echo "user: $USER" ' >> /opt/startup.sh \
    && echo 'echo "passwd: $PASSWD" ' >> /opt/startup.sh \
    && echo 'useradd $USER' >> /opt/startup.sh \
    && echo 'echo $USER:$PASSWD | chpasswd' >> /opt/startup.sh \
    && echo '/etc/init.d/ssh restart' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

EXPOSE 22
CMD ["/opt/startup.sh"]
