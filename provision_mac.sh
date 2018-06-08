#!/bin/bash

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"


/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install \
  ack \
  awscli \
  bash \
  bash-completion \
  coreutils \
  cowsay \
  figlet \
  fortune \
  gawk \
  gdbm \
  gettext \
  git \
  gmp \
  gnu-sed \
  htop \
  jq \
  libevent \
  libidn2 \
  libunistring \
  macprefs \
  mpfr \
  nmap \
  oniguruma \
  openssl \
  python \
  readline \
  sqlite \
  telnet \
  tmux \
  tree \
  watch \
  wget \
  xz

sudo mkdir /usr/local/src
cd /usr/local/src

sudo git clone https://github.com/phacility/arcanist.git
sudo git clone https://github.com/phacility/libphutil.git

sudo ln -s /usr/local/src/arcanist/bin/arc /usr/local/bin/arc


cp ${SCRIPT_DIR}/etc/bashrc_mac /etc/bashrc

sudo mkdir -p /usr/local/git-core/contrib/completion
sudo cp ${SCRIPT_DIR}/usr/local/git-core/contrib/completion/git-prompt.sh \
  /usr/local/git-core/contrib/completion/

sudo cp ${SCRIPT_DIR}/usr/local/share/games/fortunes/nyTimes /usr/local/share/games/fortunes/
strfile -c % \
  /usr/local/share/games/fortunes/nyTimes \
  /usr/local/share/games/fortunes/nyTimes.dat

cp -r ${SCRIPT_DIR}/.vim ~/
cp ${SCRIPT_DIR}/.vimrc ~/

export MACPREFS_BACKUP_DIR="/Volumes/WET8104/prefs"
macprefs restore

