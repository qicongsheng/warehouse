#!/bin/sh

rm -fr /tmp/jdk-7u80-linux-x64.tar.gz
curl -o /tmp/jdk-7u80-linux-x64.tar.gz -L https://github.com/frekele/oracle-java/releases/download/7u80-b15/jdk-7u80-linux-x64.tar.gz
mkdir /usr/java

tar -zxvf /tmp/jdk-7u80-linux-x64.tar.gz -C /usr/java

JAVA_HOME=/usr/java/jdk1.7.0_80

echo "# java environment" >> /etc/profile
echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile
echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
echo "export PATH=\$PATH:/etc/sbin:\$JAVA_HOME/bin" >> /etc/profile

source /etc/profile
rm -fr /tmp/jdk-7u80-linux-x64.tar.gz

