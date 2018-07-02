#!/bin/bash

########################################
#
# Software Installation
#
########################################

yum update -y

yum install -y \
  gcc \
  gcc-c++ \
  make \
  cmake \
  sssd \
  wget \
  samba-common-tools \
  firewall-cmd \
  epel-release \
  git

yum install -y \
  cmake3 \
  dkms \
  yum-utils \
  device-mapper-persistent-data \
  lvm2 \
  kernel-devel \
  fail2ban


########################################
#
# Service Instantiation
#
########################################

systemctl enable firewalld
systemctl start firewalld
systemctl enable fail2ban
systemctl start fail2ban


########################################
#
# Kill SELinux
#
########################################

setenforce 0
sed -i 's/SELINUX=enabled/SELINUX=disabled/' /etc/selinux/config


########################################
#
# Python2/3
#
########################################

yum install -y python36 python36-devel
cd /tmp
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python36 ./get-pip.py

pip3 install --upgrade pip
pip3 install numpy pandas scipy matplotlib sklearn

yum install -y python python-devel python-pip
pip install numpy pandas scipy matplotlib sklearn
