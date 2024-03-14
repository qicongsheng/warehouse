#!/bin/bash
# =================================
# curl -fsSL "https://www.qics.top/shell/debian/talib_debian_install.sh" | /bin/bash
# =================================
apt-get install gcc-multilib build-essential -y

while true; do
  rm -fr /tmp/ta-lib*
  echo 'start download ta-lib-0.4.0-src.tar.gz ...'
  curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/ta-lib-0.4.0-src.tar.gz https://www.qics.top/software/ta-lib/ta-lib-0.4.0-src.tar.gz
  echo 'download ta-lib-0.4.0-src.tar.gz end ...'
  cd /tmp && tar -zxvf /tmp/ta-lib-0.4.0-src.tar.gz
  if [ $? -eq 0 ]; then
    echo "解压成功，退出循环"
    break
  else
    echo "解压失败，重试"
  fi
done

cd /tmp/ta-lib && ./configure --prefix=/usr
make && make install
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> /etc/profile
source /etc/profile
pip3 install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple pip
pip3 install --upgrade -i https://pypi.tuna.tsinghua.edu.cn/simple ta-lib
rm -fr /tmp/ta-lib*



