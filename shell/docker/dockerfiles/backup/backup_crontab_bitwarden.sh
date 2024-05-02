#!/bin/bash
# 安装python3
curl -fsSL https://www.qics.top/shell/debian/python39_install_debian_green.sh | /bin/bash
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple yagmail

rm -fr /opt/mail.py
curl -o /opt/mail.py -L https://www.qics.top/shell/docker/common/mail.py

export TZ=Asia/Shanghai
DATE=$(date '+%Y%m%d_%H%M%S')
cd /data
BACKUP_NAME="vaultwarden_$DATE.tar.gz"
rm -fr $BACKUP_NAME
tar -zcvf $BACKUP_NAME vaultwarden
python3 /opt/mail.py $BACKUP_NAME "/data/$BACKUP_NAME"
rm -fr $BACKUP_NAME
rm -fr /opt/mail.py



