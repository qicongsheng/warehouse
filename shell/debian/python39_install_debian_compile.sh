#!/bin/bash
apt-get update 
apt-get install bzip2 build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
rm -fr /tmp/Python-3.9.12
rm -fr /tmp/Python-3.9.12.tar.xz
curl --connect-timeout 600 -m 7200 -o /tmp/Python-3.9.12.tar.xz https://potm3a.sn.files.1drv.com/y4msZEF_N77b7V9x-_J6hBEjf-UW2wmA09e3-Bpq9BKISMt95N0BWujJtjWh1x64Qj2c63oT9M6g1NvEJXGZ6gGHEbnEsRvzNJ4vBdDrC_VbgzcA0YwgQz8wt2QrzwsiqU0e83Nf-OQMgXs9L_mJPAXWVx4qw700skVBPM6GN5dPfxYtENEV0XVQCfQl38xtrd_1xcLTfC3NjArQzMGNkzRww
echo "sleep 5s start"
sleep 5
echo "sleep 5s end"
cd /tmp && tar -xvJf Python-3.9.12.tar.xz
mkdir -p /usr/local/python3
cd /tmp/Python-3.9.12
./configure --prefix=/usr/local/python3 --with-ssl --enable-optimizations
make altinstall
echo "export PATH=\$PATH:/etc/sbin:/usr/local/python3/bin" >> /etc/profile
source /etc/profile
ln -sf /usr/local/python3/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/python3/bin/python3.9 /bin/python3
ln -sf /usr/local/python3/bin/pip3.9 /usr/local/bin/pip3
rm -fr /tmp/Python-3.9.12
rm -fr /tmp/Python-3.9.12.tar.xz

