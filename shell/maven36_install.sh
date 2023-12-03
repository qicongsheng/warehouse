#!/bin/bash

rm -fr /tmp/apache-maven-3.6.3
rm -fr /tmp/apache-maven-3.6.3.tar.gz
curl --connect-timeout 600 -m 7200 -o /tmp/apache-maven-3.6.3.tar.gz -L https://rosw8w.sn.files.1drv.com/y4mMP0dpw9PeZ-Guymko-q4adinTBrq_7DIml47yT131r7lVwwDdL-RCz2rId6o-_oB3tJUlj4s717OiJWEv7oPVC7SvR219LX8UsXYVIf8ptCPBJt0wxI-xZZstotT-hrzyC13xkj9KtRnitfV4ftuQh4oqUenvfTZTH0tOZMhuxugRc9TT30O67yQ-YXUUhv5s955dlOR2Np0dukzBMxgdQ
mkdir -p /usr/java

tar -zxvf /tmp/apache-maven-3.6.3.tar.gz -C /usr/java

MAVEN_HOME=/usr/java/apache-maven-3.6.3

echo "# maven environment" >> /etc/profile
echo "export MAVEN_HOME=$MAVEN_HOME" >> /etc/profile
echo "export PATH=\$PATH:/etc/sbin:\$MAVEN_HOME/bin" >> /etc/profile

source /etc/profile
rm -fr /tmp/apache-maven-3.6.3
rm -fr /tmp/apache-maven-3.6.3.tar.gz


