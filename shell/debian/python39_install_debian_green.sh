#!/bin/bash
apt-get update 
apt-get install bzip2 build-essential libreadline-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
rm -fr /tmp/python-3.9.12-debian.tar.gz
curl -o /tmp/python-3.9.12-debian.tar.gz https://ehckxq.sn.files.1drv.com/y4msFMU-V_ZIaEEvZiVvir06mZSmkmvvhHs-HkhmS5H21UgJsROtFyn32ycnmgE8iEqiv8uSqsyNyyT-KeKlcc7m7zcwy6TcuUj-U3_0HLWHnbuB-2PNeHUR6G3BpCssi9DhqrFrhP-Mr3ia5P6CeTeGsWj7ZLPimHcd3A59EOfuazyM5TadnnHocAeQSL38Oe90K1ug7JxftKsUULfVuMBjg
tar -zxvf /tmp/python-3.9.12-debian.tar.gz -C /usr/local
echo "export PATH=\$PATH:/etc/sbin:/usr/local/python3/bin" >> /etc/profile
source /etc/profile
ln -sf /usr/local/python3/bin/python3.9 /usr/local/bin/python3
ln -sf /usr/local/python3/bin/python3.9 /bin/python3
ln -sf /usr/local/python3/bin/pip3.9 /usr/local/bin/pip3
rm -fr /tmp/python-3.9.12-debian.tar.gz

