#!/bin/bash
# curl -fsSL "https://www.qics.top/shell/quant/setup.sh" | /bin/bash

curl -fsSL "https://www.qics.top/shell/vps/container_init.sh" | /bin/bash
apt install git -y
cd ~
git clone https://oauth2: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@github.com/qicongsheng/pickstar.git
cd pickstar
chmod -R 777 *.sh
chmod -R 777 *.py
curl -fsSL "https://www.qics.top/shell/debian/python39_install_debian.sh" | /bin/bash
pip3 install pip --upgrade
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple mplfinance flexitext pymysql loguru scipy requests urllib3==1.26.15 matplotlib pyalgotrade pandas tushare tqsdk 
curl -fsSL "http://www.qics.top/shell/debian/talib_debian_install.sh" | /bin/bash
cd ~/pickstar
sh start.sh
sh restart.sh

