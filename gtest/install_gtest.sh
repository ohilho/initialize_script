#! /bin/bash
BASE_DIR=$(dirname "$0")
CUR_DIR=$(pwd)
source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/feature/safe_sudo/common.sh)
# dependent packages
apt_pkgs=(git build-essential cmake)
apt_install_array ${apt_pkgs}

# clone gtest git repository
git clone https://github.com/google/googletest.git googletest_download;

# build
cd googletest_download && mkdir -p build && cd build && cmake .. && safe_sudo "make install";

# clean up gtest dir
rm -rf ${CUR_DIR}/googletest_download;
