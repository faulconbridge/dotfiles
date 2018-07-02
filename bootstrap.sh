#!/bin/bash

################################################################################
#
# Make the script abort out if it breaks.
#
################################################################################

set -euo pipefail


################################################################################
#
# Convenience functions
#
################################################################################

info () {
  printf "\r[ \033[00;34m..\033[0m ] $1\n"
}

user () {
  printf "\r[ \033[0;33m??\033[0m ] $1 "
}

success () {
  printf "\r\033[2K[ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K[\033[0;31mFAIL\033[0m] $1\n"
}


################################################################################
#
# Constants
#
################################################################################

SCRIPT_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]")
DISTRO=""

info "Trying to determine distribution..."
# If Linux, try to determine specific distribution
if [ "${UNAME}" == "linux" ]; then
  # If available, use LSB to identify distribution
  if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
    export DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'//)
  # Otherwise, use release info file
  elif [ -f /etc/os-release ]; then
    export DISTRO=$(awk -F= '/^ID=/{print $2}' /etc/os-release)
  else
    export DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | \
      grep -v "lsb" | \
      grep -v "system" | \
      grep -v "/os" | \
      cut -d'/' -f3 | \
      cut -d'-' -f1 | \
      cut -d'_' -f1 | \
      uniq | \
      head -1)
  fi
fi

# For everything else (or if above failed), just use generic identifier
[ "${DISTRO}" == "" ] && export DISTRO="${UNAME}"
unset UNAME

success "We've guessed that you are running ${DISTRO}."

################################################################################
#
# Distribution-specific installs
#
################################################################################

info "Installing ${DISTRO}-specific packages..."
if [ "${DISTRO}" == "darwin" ]; then
  source "${SCRIPT_PATH}"bootstrap/mac/provision_mac.sh
# elif [ "${DISTRO}" == "centos" ]; then
#   source "${SCRIPT_PATH}"bootstrap/mac/provision_centos.sh
# elif [ "${DISTRO}" == "redhat" ] || [ "${DISTRO}" == "rhel" ]; then
#   source "${SCRIPT_PATH}"bootstrap/mac/provision_rhel.sh
elif [ "${DISTRO}" == "fedora" ]; then
  source "${SCRIPT_PATH}"bootstrap/mac/provision_fedora.sh
else
  fail "Are you running Windows? Or an internet-conencted toaster? Stop that."

success "Successfully installed ${DISTRO}-specific packages."

################################################################################
#
# Universal installs
#
################################################################################

info "Installing common packages..."

source "${SCRIPT_PATH}"bootstrap/common/common_installs.sh
success "Successfully installed common packages."
