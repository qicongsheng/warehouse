#!/bin/bash
hostnamectl --static set-hostname $1

systemctl disable firewalld.service
systemctl stop firewalld.service
iptables -F

echo '[kubernetes]' >> /etc/yum.repos.d/kubernetes.repo
echo 'name=Kubernetes' >> /etc/yum.repos.d/kubernetes.repo
echo 'baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64/' >> /etc/yum.repos.d/kubernetes.repo
echo 'enabled=1' >> /etc/yum.repos.d/kubernetes.repo
echo 'gpgcheck=1' >> /etc/yum.repos.d/kubernetes.repo
echo 'repo_gpgcheck=1' >> /etc/yum.repos.d/kubernetes.repo
echo 'gpgkey=https://mirrors.aliyun.com/kubernetes/yum/doc/yum-key.gpg' >> /etc/yum.repos.d/kubernetes.repo
echo '       https://mirrors.aliyun.com/kubernetes/yum/doc/rpm-package-key.gpg' >> /etc/yum.repos.d/kubernetes.repo

wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo -O /etc/yum.repos.d/docker-ce.repo
yum -y install docker-ce-18.06.1.ce-3.el7
systemctl enable docker && systemctl start docker

# 1.18.3-0
yum install -y --nogpgcheck kubelet kubeadm kubectl 
systemctl enable kubelet && systemctl start kubelet

echo 'net.bridge.bridge-nf-call-iptables=1' >> /etc/sysctl.d/k8s-sysctl.conf
echo 'net.bridge.bridge-nf-call-ip6tables=1' >> /etc/sysctl.d/k8s-sysctl.conf
sysctl -p /etc/sysctl.d/k8s-sysctl.conf



