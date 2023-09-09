#!/bin/bash
yum -y groupinstall "Development tools"
yum -y install gcc zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel libffi-devel zlib* yum-utils 
yum-builddep python -y
rm -fr /tmp/Python-3.9.12
rm -fr /tmp/Python-3.9.12.tar.xz
curl -o /tmp/Python-3.9.12.tar.xz https://potm3a.sn.files.1drv.com/y4mLOcQY2Mv5TwB_2iy9a16VezAJWbq9x-LbvkAjq2q35Xto2HjYaJJuAThr5mGhVqW0-OcJ4_neILzMH_3osqvN6iPSTb3UNQx1OTuV2A9v4wePbzhWITB0wQTwJT2Zm4e3JpkuomJVz0LrBoQATMbSZVagK5ihP6NjZsqBPtmkoJUeNt2cYvsIpcVmmbkCpKwvhjFuXV_Zgc35ENFZFmiOA
cd /tmp && tar -xvJf Python-3.9.12.tar.xz
mkdir /usr/local/python3
cd /tmp/Python-3.9.12
./configure --prefix=/usr/local/python3 --with-ssl
make && make install
echo "export PATH=\$PATH:/etc/sbin:/usr/local/python3/bin" >> /etc/profile
source /etc/profile
ln -sf /usr/local/python3/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/python3/bin/python3.9 /bin/python3
ln -sf /usr/local/python3/bin/pip3 /usr/local/bin/pip3
rm -fr /tmp/Python-3.9.12
rm -fr /tmp/Python-3.9.12.tar.xz


