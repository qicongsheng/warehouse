# docker build -t qics/pickstar .
FROM qics/debian:latest
MAINTAINER qics

RUN curl -fsSL "https://www.qics.top/shell/debian/python39_install_debian_green.sh" | /bin/bash \
    && pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple pip --upgrade \
    && pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple mplfinance flexitext pymysql loguru scipy requests urllib3==1.26.15 matplotlib pyalgotrade pandas tushare tqsdk pycryptodome xmltodict flask yagmail \
    && curl -fsSL "http://www.qics.top/shell/debian/talib_debian_install.sh" | /bin/bash \
    && rm -fr /tmp/*

