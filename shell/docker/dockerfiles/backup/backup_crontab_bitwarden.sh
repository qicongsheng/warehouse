#!/bin/bash
echo `date '+%Y-%m-%d %H:%M:%S'` "backup bitwarden start..." >> /var/log/backup.log
# 安装python3
curl -fsSL https://www.qics.top/shell/debian/python39_install_debian_green.sh | /bin/bash
source /etc/profile
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple yagmail
# 安装rclone
curl -fsSL https://www.qics.top/shell/rclone/rclone-debian-amd64.sh | /bin/sh

export TZ=Asia/Shanghai

UUID=$(cat /proc/sys/kernel/random/uuid | sed 's/-//g')
PYTHON_FILE_NAME="python_$UUID.py"
echo `date '+%Y-%m-%d %H:%M:%S'` "get $PYTHON_FILE_NAME..." >> /var/log/backup.log
curl -o /tmp/$PYTHON_FILE_NAME -L https://www.qics.top/shell/docker/common/mail.py

DATE=$(date '+%Y%m%d_%H%M%S')
cd /data
BACKUP_NAME="vaultwarden_$DATE.tar.gz"
rm -fr $BACKUP_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "tar $BACKUP_NAME package..." >> /var/log/backup.log
tar -zcvf $BACKUP_NAME vaultwarden

# 备份到邮件
echo `date '+%Y-%m-%d %H:%M:%S'` "send mail $BACKUP_NAME package..." >> /var/log/backup.log
python3 /tmp/$PYTHON_FILE_NAME "bitwarden" "bitwarden backup[$BACKUP_NAME]" "/data/$BACKUP_NAME"

# 备份到onedriver
echo `date '+%Y-%m-%d %H:%M:%S'` "upload onedriver $BACKUP_NAME package..." >> /var/log/backup.log
cp $BACKUP_NAME /onedriver/backup/vaultwarden
rm -fr /onedriver/backup/vaultwarden/vaultwarden.tar.gz
cp /onedriver/backup/vaultwarden/$BACKUP_NAME /onedriver/backup/vaultwarden/vaultwarden.tar.gz

rm -fr $BACKUP_NAME
rm -fr /tmp/$PYTHON_FILE_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "backup bitwarden end..." >> /var/log/backup.log


