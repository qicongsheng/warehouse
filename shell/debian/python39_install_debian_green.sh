#!/bin/bash
apt-get update 
apt-get install bzip2 build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
rm -fr /tmp/python3.9.12.tar.gz
curl -o /tmp/python3.9.12.tar.gz https://public.sn.files.1drv.com/y4m3BfQRptBZ6oavtGJwh67y6YIDHzVkWsGHMIGdDIoo9hSQcjuf5O8qa977FswvVD9MRfBa1n2pC_dDOuG8hzikFAPGtTaDLGRNc6gnCjRQ_atvuV1Bj1NbyTp_pD29rpWTDRUKA9KHNC6BQ7I7ET_CiNMWZ9PSK3xXeA4jeY6aXuKSBReAlVKMi7E33304mPak6erAnmJo2sx909sJzm4PAOIu5nMzkZxSj5VVOcuiQg?AVOverride=1
tar -zxvf /tmp/python3.9.12.tar.gz -C /usr/local
echo "export PATH=\$PATH:/etc/sbin:/usr/local/python3/bin" >> /etc/profile
source /etc/profile
ln -sf /usr/local/python3/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/python3/bin/python3.9 /bin/python3
ln -sf /usr/local/python3/bin/pip3.9 /usr/local/bin/pip3
rm -fr /tmp/python3.9.12.tar.gz

