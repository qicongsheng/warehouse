#!/bin/bash
# =================================
# 屏蔽每天SSH暴力破解超过5次的ip
# =================================
export TZ=Asia/Shanghai
DATE=$(date +"%a %b %e")
# %星期 %月 %天 其中，星期、月都是英文简写显示；用于匹配lastb
# %e:单数字时显示7;而%d显示07
echo `date '+%Y-%m-%d %H:%M:%S'` "blockip check start..." >> /var/log/blockip.log
# lastb：上次登录失败的记录
# grep "$DATE"：匹配天的ssh失败记录
# {for(i in a)if(a[i]>=5)print i}：小括号表示判断条件
ABNORMAL_IP=$(lastb -a |grep "$DATE" | grep -v 'btmp begins'| awk '{print $NF}'  | awk '{a[$1]++}END{for(i in a)if(a[i]>=5)print i}')
for IP in $ABNORMAL_IP; do
  # 查看系统黑名单中是否已存在需要屏蔽的ip
  insert_ip=`grep "$IP" /etc/hosts.deny | wc -l`
  if [ $insert_ip -le 0 ] ; then
    echo `date '+%Y-%m-%d %H:%M:%S'` "屏蔽IP：$IP" >> /var/log/blockip.log
    echo "sshd:${IP}" >> /etc/hosts.deny
  else
    : #空执行下
    # echo "IP：$IP 已存在系统黑名单中" >> /var/log/blockip.log
  fi
done
echo `date '+%Y-%m-%d %H:%M:%S'` "blockip check end" >> /var/log/blockip.log



