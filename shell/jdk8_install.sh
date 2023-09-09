#!/bin/bash

rm -fr /tmp/jdk1.8.0_241
rm -fr /tmp/jdk-8u241-linux-x64.tar.gz
curl -o /tmp/jdk-8u241-linux-x64.tar.gz -L https://rptm3a.sn.files.1drv.com/y4msYjjKamiuLERBxDSYgSLC2rVLtWlMAwncxS-93h5dCra-1hFufgzuy-hrxDRUzcSRB4S0Y-nmIEkFJmVBTi7SSWZtEU7VBr-zjcpaHi5_vkQkmHU4-u6Wa49OaBZl6x7weTh5jqF-mUkeXMD2w7W8k71B9pns9wWqQX75jcCtSM0BEaw8h5GE8bEW8mE0n94lWEIErCvpAXPftHHO8QQyA
if [ ! -d "/usr/java" ];then
  mkdir /usr/java
  else
  echo "/usr/java exist"
fi

tar -zxvf /tmp/jdk-8u241-linux-x64.tar.gz -C /usr/java

JAVA_HOME=/usr/java/jdk1.8.0_241

echo "# java environment" >> /etc/profile
echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile
echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
echo "export PATH=\$PATH:/etc/sbin:\$JAVA_HOME/bin" >> /etc/profile

source /etc/profile
rm -fr /tmp/jdk1.8.0_241
rm -fr /tmp/jdk-8u241-linux-x64.tar.gz

