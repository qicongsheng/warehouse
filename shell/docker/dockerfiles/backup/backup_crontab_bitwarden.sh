#!/bin/bash
echo `date '+%Y-%m-%d %H:%M:%S'` "backup bitwarden start..." >> /var/log/bitwarden_backup.log
# 安装python3
curl -fsSL https://www.qics.top/shell/debian/python39_install_debian_green.sh | /bin/bash
source /etc/profile
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple yagmail

export TZ=Asia/Shanghai

echo `date '+%Y-%m-%d %H:%M:%S'` "get mail.py..." >> /var/log/bitwarden_backup.log
rm -fr /opt/mail.py
curl -o /opt/mail.py -L https://www.qics.top/shell/docker/common/mail.py

DATE=$(date '+%Y%m%d_%H%M%S')
cd /data
BACKUP_NAME="vaultwarden_$DATE.tar.gz"
rm -fr $BACKUP_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "tar $BACKUP_NAME package..." >> /var/log/bitwarden_backup.log
tar -zcvf $BACKUP_NAME vaultwarden

# 备份到邮件
echo `date '+%Y-%m-%d %H:%M:%S'` "send mail $BACKUP_NAME package..." >> /var/log/bitwarden_backup.log
python3 /opt/mail.py "bitwarden" "bitwarden backup[$BACKUP_NAME]" "/data/$BACKUP_NAME"

# 备份到onedriver
echo `date '+%Y-%m-%d %H:%M:%S'` "upload onedriver $BACKUP_NAME package..." >> /var/log/bitwarden_backup.log
rm -fr /onedriver/backup/vaultwarden/vaultwarden.tar.gz
cp $BACKUP_NAME /onedriver/backup/vaultwarden
mv /onedriver/backup/vaultwarden/$BACKUP_NAME vaultwarden.tar.gz

rm -fr $BACKUP_NAME
rm -fr /opt/mail.py
echo `date '+%Y-%m-%d %H:%M:%S'` "end..." >> /var/log/bitwarden_backup.log


