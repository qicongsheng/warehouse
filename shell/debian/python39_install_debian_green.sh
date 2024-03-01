#!/bin/bash
apt-get update 
apt-get install bzip2 build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
rm -fr /tmp/python-3.9.12-debian.tar.gz
echo 'start download python-3.9.12-debian.tar.gz ...'
curl --connect-timeout 600 -m 7200 --continue-at - -o /tmp/python-3.9.12-debian.tar.gz https://fha48w.sn.files.1drv.com/y4mv_dgoOkGNYbbFaokTgrdv5Cifs0xGeahNLCec5oC9YByv7wbV1a4-CkM_zmow4OrPDpD8-aX9Wo-fmuf-PmW2SOjg3fhAfLPpMAsiJDv28ZEvyQgV-YU_F4ue_o80nL8_Om_dkEEosy7KPrz5OKwsSHpeWOGsR-3WaIdNbIaQ0sn_IhLiZqLUewOVOeLYvomKJqMtJ6ASzWzzvoPpmWiEA
echo 'download python-3.9.12-debian.tar.gz end ...'
tar -zxvf /tmp/python-3.9.12-debian.tar.gz -C /usr/local
echo "export PATH=\$PATH:/etc/sbin:/usr/local/python3/bin" >> /etc/profile
source /etc/profile
ln -sf /usr/local/python3/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/python3/bin/python3.9 /bin/python3
ln -sf /usr/local/python3/bin/pip3.9 /usr/local/bin/pip3
rm -fr /tmp/python-3.9.12-debian.tar.gz

