#!/bin/bash
# curl -fsSL https://www.qics.top/shell/docker/dockerfiles/vaultwarden/vaultwarden_backup.sh | /bin/bash
export TZ=Asia/Shanghai
DATE=$(date +"%a %b %e")
cd /data
BACKUP_NAME="vaultwarden-$DATE.tar.gz vaultwarden"
rm -fr $BACKUP_NAME
rm -fr /onedriver/data/vaultwarden/$BACKUP_NAME
tar -zcvf $BACKUP_NAME vaultwarden
cp $BACKUP_NAME /onedriver/data/vaultwarden/
rm -fr $BACKUP_NAME


