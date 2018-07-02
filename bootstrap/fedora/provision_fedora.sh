#!/bin/bash

########################################
#
# System updates
#
########################################

sudo dnf update -y
sudo dnf install \
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

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf check-update
sudo dnf install code


########################################
#
# Custom themes, fonts
#
########################################

sudo dnf copr enable tcg/themes
sudo dnf install materia-theme

sudo dnf install google-roboto-fonts

cd /usr/local/src
sudo git clone https://github.com/snwh/paper-icon-theme.git /usr/local/src/paper-icon-theme
cd paper-icon-theme
sudo ./autogen.sh
sudo make
sudo make install

cd /usr/local/src
sudo git clone https://github.com/google/roboto.git /usr/local/src/roboto
cd roboto/
sudo pip install -r requirements.txt
sudo make
sudo make install
sudo killall -HUP gnome-shell

sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudoyum install freetype-devel freetype-freeworld

cp "${SCRIPT_DIR}"etc/fonts/local.conf /etc/fonts/local.conf
