#! /bin/bash
BASE_DIR=$(dirname "$0")
CUR_DIR=$(pwd)


curl https://raw.githubusercontent.com/ohilho/initialize_script/master/git/.gitconfig > ${HOME}/.gitconfig