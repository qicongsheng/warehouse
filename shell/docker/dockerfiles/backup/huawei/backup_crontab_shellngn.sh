#!/bin/bash
export TZ=Asia/Shanghai
echo `date '+%Y-%m-%d %H:%M:%S'` "backup shellngn start..." >> /var/log/backup.log
# 安装python3
curl -fsSL https://www.qics.top/shell/debian/python39_install_debian_green.sh | /bin/bash
source /etc/profile
pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple yagmail
# 安装rclone
curl -fsSL https://www.qics.top/shell/rclone/rclone-debian-amd64.sh | /bin/sh

UUID=$(cat /proc/sys/kernel/random/uuid | sed 's/-//g')
PYTHON_FILE_NAME="python_$UUID.py"
echo `date '+%Y-%m-%d %H:%M:%S'` "get $PYTHON_FILE_NAME..." >> /var/log/backup.log
curl -o /tmp/$PYTHON_FILE_NAME -L https://www.qics.top/shell/docker/common/mail.py

DATE=$(date '+%Y%m%d_%H%M_%S')
cd /data
BACKUP_NAME="shellngn_$DATE.tar.gz"
rm -fr $BACKUP_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "tar $BACKUP_NAME package..." >> /var/log/backup.log
tar -zcvf $BACKUP_NAME shellngn

# 备份到邮件
echo `date '+%Y-%m-%d %H:%M:%S'` "send mail $BACKUP_NAME package..." >> /var/log/backup.log
python3 /tmp/$PYTHON_FILE_NAME "shellngn" "shellngn backup[$BACKUP_NAME]" "/data/$BACKUP_NAME"

# 备份到onedriver
echo `date '+%Y-%m-%d %H:%M:%S'` "upload onedriver $BACKUP_NAME package..." >> /var/log/backup.log
cp $BACKUP_NAME /onedriver/backup/shellngn
rm -fr /onedriver/backup/shellngn/shellngn.tar.gz
cp /onedriver/backup/shellngn/$BACKUP_NAME /onedriver/backup/shellngn/shellngn.tar.gz

rm -fr $BACKUP_NAME
rm -fr /tmp/$PYTHON_FILE_NAME
echo `date '+%Y-%m-%d %H:%M:%S'` "backup shellngn end..." >> /var/log/backup.log


