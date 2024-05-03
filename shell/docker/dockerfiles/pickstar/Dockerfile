# docker build -t ghcr.io/qicongsheng/pickstar .
# =================================
# docker run -d --restart=always -e USER=root -e PASSWD=Star8ks.# -p 127.0.0.1:8022:22 -p 8082:8082 --privileged=true -v /tmp:/tmp ghcr.io/qicongsheng/pickstar
# =================================
FROM ghcr.io/qicongsheng/debian:latest
MAINTAINER qicongsheng

RUN curl -fsSL "https://www.qics.top/shell/debian/python39_install_debian_green.sh" | /bin/bash \
    && apt install git -y \
    && pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pip --upgrade \
    && pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple mplfinance flexitext pymysql loguru scipy requests urllib3==1.26.15 matplotlib pyalgotrade pandas tushare tqsdk pycryptodome xmltodict flask yagmail \
    && curl -fsSL "http://www.qics.top/shell/debian/talib_debian_install.sh" | /bin/bash \
    && apt autoclean \
    && rm -fr /root/.cache/pip \
    && rm -fr /tmp/*


