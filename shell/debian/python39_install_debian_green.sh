#!/bin/bash
apt-get update 
apt-get install bzip2 build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
rm -fr /tmp/python3.9.12.tar.gz
curl -o /tmp/python3.9.12.tar.gz https://potm3a.sn.files.1drv.com/y4mLOcQY2Mv5TwB_2iy9a16VezAJWbq9x-LbvkAjq2q35Xto2HjYaJJuAThr5mGhVqW0-OcJ4_neILzMH_3osqvN6iPSTb3UNQx1OTuV2A9v4wePbzhWITB0wQTwJT2Zm4e3JpkuomJVz0LrBoQATMbSZVagK5ihP6NjZsqBPtmkoJUeNt2cYvsIpcVmmbkCpKwvhjFuXV_Zgc35ENFZFmiOA
tar -zxvf /tmp/python3.9.12.tar.gz -C /usr/local
echo "export PATH=\$PATH:/etc/sbin:/usr/local/python3/bin" >> /etc/profile
source /etc/profile
ln -sf /usr/local/python3/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/python3/bin/python3.9 /bin/python3
ln -sf /usr/local/python3/bin/pip3.9 /usr/local/bin/pip3
rm -fr /tmp/python3.9.12.tar.gz

