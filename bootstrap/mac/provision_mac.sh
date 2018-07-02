#!/bin/bash

########################################
#
# Install Homebrew
#
########################################
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

brew install ack
brew install bash
brew install bash-completion
brew install cask
brew install coreutils
brew install cowsay
brew install figlet
brew install fortune
brew install gawk
brew install gdbm
brew install gettext
brew install git
brew install gmp
brew install gnu-sed
brew install htop
brew install jq
brew install nmap
brew install openssl
brew install python
brew install readline
brew install sqlite
brew install telnet
brew install tmux
brew install tree
brew install watch
brew install wg

brew install clintmod/formulas/macprefs
export MACPREFS_BACKUP_DIR="${SCRIPT_PATH}bootstrap/mac/prefs"
macprefs restore

cask_args appdir: '/Applications'
brew cask install firefox
brew cask install google-chrome
brew cask install visual-studio-code
brew cask install spotify
brew cask install iterm2
brew cask install r-app
brew cask install rstudio
brew cask install flux
brew cask install pycharm-ce
