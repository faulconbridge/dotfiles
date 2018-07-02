#!/bin/bash

########################################
#
# Update Bashrc
#
########################################

sudo cat ${SCRIPT_DIR}/etc/bashrc >> /etc/bashrc


########################################
#
# Add some Git utilities
#
########################################

sudo mkdir -p /usr/local/git-core/contrib/completion
sudo cp "${SCRIPT_PATH}"usr/local/git-core/contrib/completion/git-prompt.sh \
  /usr/local/git-core/contrib/completion/


########################################
#
# Make fortunes funny again
#
########################################

cp "${SCRIPT_DIR}"usr/local/share/games/fortunes/nyTimes \
  /usr/local/share/games/fortunes/

strfile -c % \
  /usr/local/share/games/fortunes/nyTimes \
  /usr/local/share/games/fortunes/nyTimes.dat


########################################
#
# Install Arcanist
#
########################################

sudo mkdir /usr/local/src
cd /usr/local/src

sudo git clone https://github.com/phacility/arcanist.git
sudo git clone https://github.com/phacility/libphutil.git

sudo ln -s /usr/local/src/arcanist/bin/arc /usr/local/bin/arc


########################################
#
# Vim Solarized colorscheme
#
########################################

cp -r "${SCRIPT_PATH}".vim ~/
cp "${SCRIPT_PATH}".vimrc ~/
