FROM amd64/alpine:3.15
MAINTAINER qics

ENV FRP_VERSION=0.52.1 \
    SERVER_ADDR= \
    SERVER_PORT= \
    TOKEN= \
    LOCAL_PORT= \
    REMOTE_PORT= \
    PROXY_NAME=tcp

RUN cd /root \
    && wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && cd frp_${FRP_VERSION}_linux_amd64/ \
    && cp frpc /usr/bin/ \
    && mkdir -p /etc/frp \
    && cp frpc.ini /etc/frp \
    && cd /root \
    && rm frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && rm -rf frp_${FRP_VERSION}_linux_amd64/ \

    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'rm -fr /etc/frp/frpc.ini >> /etc/frp/frpc.ini ' >> /opt/startup.sh \
    && echo 'echo "[common]" >> /etc/frp/frpc.ini ' >> /opt/startup.sh \
    && echo 'echo "server_addr = $SERVER_ADDR " >> /etc/frp/frpc.ini ' >> /opt/startup.sh \
    && echo 'echo "server_port = $SERVER_PORT " >> /etc/frp/frpc.ini ' >> /opt/startup.sh \
    && echo 'echo "token = $TOKEN " >> /etc/frp/frpc.ini' >> /opt/startup.sh \
    && echo 'echo "[$PROXY_NAME] " >> /etc/frp/frpc.ini' >> /opt/startup.sh \
    && echo 'echo "type = tcp " >> /etc/frp/frpc.ini' >> /opt/startup.sh \
    && echo 'echo "local_ip = 127.0.0.1 " >> /etc/frp/frpc.ini' >> /opt/startup.sh \
    && echo 'echo "local_port = $LOCAL_PORT " >> /etc/frp/frpc.ini' >> /opt/startup.sh \
    && echo 'echo "remote_port = $REMOTE_PORT " >> /etc/frp/frpc.ini' >> /opt/startup.sh \
    
    && echo "while true" >> /opt/startup.sh \
    && echo "do" >> /opt/startup.sh \
    && echo "	COUNT=\$(ps -ef |grep frpc |grep -v 'grep' |wc -l)" >> /opt/startup.sh \
    && echo "	if [ \$COUNT -eq 0 ]; then" >> /opt/startup.sh \
    && echo "		echo 'frpc is not running. start...'" >> /opt/startup.sh \
    && echo "		/usr/bin/frpc -c /etc/frp/frpc.ini" >> /opt/startup.sh \
    && echo "	fi" >> /opt/startup.sh \
    && echo "done" >> /opt/startup.sh \

    && echo '/usr/sbin/sshd -D &' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]
