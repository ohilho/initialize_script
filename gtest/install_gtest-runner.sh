#! /bin/bash
BASE_DIR=$(dirname "$0")
CUR_DIR=$(pwd)
URL="https://raw.githubusercontent.com/ohilho/initialize_script/master"
source <(curl -fsSL ${URL}/common.sh)
# dependent packages
safe_sudo "add-apt-repository ppa:nholthaus/gtest-runner"
apt_update
apt_pkgs=(gtest-runner)
apt_install_array ${apt_pkgs}
