FROM amd64/alpine:3.15
MAINTAINER qics

ENV FRP_VERSION=0.52.1 \
    BIND_PORT=7000 \
    DASHBOARD_PORT=7777 \
    TOKEN= \
    DASHBOARD_USER=qics \
    DASHBOARD_PWD=123456

RUN cd /root \
    && wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && tar zxvf frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && cd frp_${FRP_VERSION}_linux_amd64/ \
    && cp frps /usr/bin/ \
    && mkdir -p /etc/frp \
    && cd /root \
    && rm frp_${FRP_VERSION}_linux_amd64.tar.gz \
    && rm -rf frp_${FRP_VERSION}_linux_amd64/ \

    && echo '#!/bin/sh' >> /opt/startup.sh \
    && echo 'rm -fr /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo 'echo "bindAddr = 0.0.0.0" >> /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo 'echo "bindPort = $BIND_PORT " >> /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo 'echo "auth.token = $TOKEN " >> /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo 'echo "webServer.addr = 0.0.0.0 " >> /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo 'echo "webServer.port = $DASHBOARD_PORT " >> /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo 'echo "webServer.user = $DASHBOARD_USER " >> /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo 'echo "webServer.password = $DASHBOARD_PWD " >> /etc/frp/frps.toml' >> /opt/startup.sh \
    && echo '/usr/bin/frps -c /etc/frp/frps.toml' >> /opt/startup.sh \

    && echo '/usr/sbin/sshd -D &' >> /opt/startup.sh \
    && echo 'tail -f /dev/null' >> /opt/startup.sh \

    && chmod +x /opt/startup.sh \
    && rm -fr /tmp/*

CMD ["/opt/startup.sh"]
