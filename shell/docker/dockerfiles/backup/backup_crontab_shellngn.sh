#!/bin/bash
echo `date '+%Y-%m-%d %H:%M:%S'` "backup shellngn start..." >> /var/log/shellngn_backup.log
# 安装python3
curl -fsSL https://www.qics.top/shell/debian/python39_install_debian_green.sh | /bin/bash
source /etc/profile
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple yagmail
# 安装rclone
curl -fsSL https://www.qics.top/shell/rclone/rclone-debian-amd64.sh | /bin/sh

export TZ=Asia/Shanghai

echo `date '+%Y-%m-%d %H:%M:%S'` "get mail.py..." >> /var/log/shellngn_backup.log
rm -fr /opt/mail.py
curl -o /opt/mail.py -L https://www.qics.top/shell/docker/common/mail.py

DATE=$(date '+%Y%m%d_%H%M%S')
cd /data
BACKUP_NAME="shellngn_$DATE.tar.gz"
rm -fr $BACKUP_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "tar $BACKUP_NAME package..." >> /var/log/shellngn_backup.log
tar -zcvf $BACKUP_NAME shellngn

# 备份到邮件
echo `date '+%Y-%m-%d %H:%M:%S'` "send mail $BACKUP_NAME package..." >> /var/log/shellngn_backup.log
python3 /opt/mail.py "shellngn" "shellngn backup[$BACKUP_NAME]" "/data/$BACKUP_NAME"

# 备份到onedriver
echo `date '+%Y-%m-%d %H:%M:%S'` "upload onedriver $BACKUP_NAME package..." >> /var/log/shellngn_backup.log
cp $BACKUP_NAME /onedriver/backup/shellngn
rm -fr /onedriver/backup/shellngn/shellngn.tar.gz
cp /onedriver/backup/shellngn/$BACKUP_NAME /onedriver/backup/shellngn/shellngn.tar.gz

rm -fr $BACKUP_NAME
rm -fr /opt/mail.py
echo `date '+%Y-%m-%d %H:%M:%S'` "end..." >> /var/log/shellngn_backup.log


