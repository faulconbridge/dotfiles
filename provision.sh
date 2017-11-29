#!/bin/bash

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

dnf update -y
dnf install \
  dkms \
  gcc \
  make \
  kernel-devel \
  kernel-headers \
  bzip2 \
  binutils \
  patch \
  ibgomp \
  glibc-headers \
  glibc-devel \
  git \
  dh-autoreconf \
  autoreconf \
  cowsay \
  fortune-mod \
  figlet \
  google-chrome-stable \
  python3 \
  python3-devel \
  python-virtualenv \
  python3-pip \
  gnome-tweak-tool

dnf copr enable tcg/themes
dnf install materia-theme

dnf install google-roboto-fonts

rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
dnf install code


cd /usr/local/src
git clone https://github.com/snwh/paper-icon-theme.git
cd paper-icon-theme
./autogen.sh
make
make install

cd /usr/local/src
git clone https://github.com/google/roboto.git
cd roboto/
ls
pip install -r requirements.txt
exit
make
make install
killall -HUP gnome-shell

dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
yum install freetype-devel freetype-freeworld

cp ${SCRIPT_DIR}/etc/fonts/local.conf /etc/fonts/local.conf
cp ${SCRIPT_DIR}/etc/bashrc /etc/bashrc


