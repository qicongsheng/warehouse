#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/vaultwarden/vaultwarden_backup.sh | /bin/bash
export TZ=Asia/Shanghai
DATE=$(date '+%Y%m%d%H%M%S')
cd /data
BACKUP_NAME="vaultwarden_$DATE.tar.gz"
rm -fr $BACKUP_NAME
rm -fr /onedriver/data/vaultwarden/$BACKUP_NAME
tar -zcvf $BACKUP_NAME vaultwarden
mkdir - p /onedriver/data/vaultwarden
cp $BACKUP_NAME /onedriver/data/vaultwarden/
rm -fr $BACKUP_NAME


