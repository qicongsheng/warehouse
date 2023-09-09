#!/bin/bash
# =================================
# curl -fsSL "https://www.qics.top/shell/debian/talib_debian_install.sh" | /bin/bash
# =================================
apt-get install gcc-multilib build-essential -y
rm -fr /tmp/ta-lib* /tmp/TA-Lib*
curl -o /tmp/ta-lib-0.4.0-src.tar.gz https://www.qics.top/software/ta-lib/ta-lib-0.4.0-src.tar.gz
curl -o /tmp/TA-Lib-0.4.26.tar.gz https://www.qics.top/software/ta-lib/TA-Lib-0.4.26.tar.gz
cd /tmp && tar -zxvf /tmp/ta-lib-0.4.0-src.tar.gz
cd /tmp/ta-lib && ./configure --prefix=/usr
make && make install
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> /etc/profile
source /etc/profile
pip3 install pip --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple
cd /tmp && pip3 install TA-Lib-0.4.26.tar.gz
rm -fr /tmp/ta-lib* /tmp/TA-Lib*



