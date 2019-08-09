#!/bin/sh

yum install wget -y
wget -P /tmp https://github.com/frekele/oracle-java/releases/download/8u171-b11/jdk-8u171-linux-x64.tar.gz
mkdir /usr/java

tar -zxvf /tmp/jdk-8u171-linux-x64.tar.gz -C /usr/java

JAVA_HOME=/usr/java/jdk1.8.0_171

echo "# java environment" >> /etc/profile
echo "export JAVA_HOME=$JAVA_HOME" >> /etc/profile
echo "export CLASSPATH=.:\$JAVA_HOME/lib/dt.jar:\$JAVA_HOME/lib/tools.jar" >> /etc/profile
echo "export PATH=\$PATH:/etc/sbin:\$JAVA_HOME/bin" >> /etc/profile

source /etc/profile
rm -fr /tmp/jdk-8u171-linux-x64.tar.gz

