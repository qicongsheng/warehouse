# docker build -t qics/playdocker .
FROM qics/debian:latest
MAINTAINER qics

ADD frp_vpn.py /opt/frp_vpn.py

RUN curl -o /opt/frp_vpn.py -L https://www.qics.top/shell/docker/dockerfiles/playdocker/frp_vpn.py \
    && curl -fsSL "https://www.qics.top/shell/debian/python39_install_debian_green.sh" | /bin/bash \
    && pip3 install pip --upgrade \
    && pip3 install paramiko loguru selenium \
    && sed -i 's/echo plugin/nohup python3 \/opt\/frp_vpn.py \&/g' /opt/startup.sh \
    && chmod +x /opt/frp_vpn.py \
    && apt autoclean \
    && rm -fr /root/.cache/pip \
    && rm -fr /tmp/*
