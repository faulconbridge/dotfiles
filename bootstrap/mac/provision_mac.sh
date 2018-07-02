#!/bin/bash

########################################
#
# Install Homebrew
#
########################################
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew install \
  ack \
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
  nmap \
  openssl \
  python \
  readline \
  sqlite \
  telnet \
  tmux \
  tree \
  watch \
  wget

brew install clintmod/formulas/macprefs
export MACPREFS_BACKUP_DIR="${SCRIPT_PATH}bootstrap/mac/prefs"

macprefs restore
