#! /bin/bash

# @brief
#   Run command with 'sudo' when it is installed, else just run the command without 'sudo'.
#   In case there is no 'sudo' installed in base image, running 'sudo' makes 'command not found' error.
#
# @param $1 : command to run
function safe_sudo(){
    local comm=$1
    if [ -n "$(which sudo)" ]; then
        sudo $comm
    else
        $comm
    fi    
}

# @brief 
#   Install apt packages with safe sudo
#   Packages to install are passed in the list form.
#
# @param $1 : list of apt-get install parameters
function apt_install_array(){
    local pkg_list=$1
    safe_sudo "apt-get install -y ${pkg_list[@]}"
}

# @brief
#   run apt-get update with safe_sudo
#
function apt_update(){
    safe_sudo "apt-get update"
}

# @brief
#   source the shell script from git repository.
#   'curl' is required.
function curl_source(){
    local path=$1
    source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/feature/safe_sudo/${path})
}

apt_pkgs=(curl)
apt_install_array ${apt_pkgs}

# set defualt gitconfig
curl_source("git/install_gitconfig.sh")
# install oh-my-zsh with some plugins
curl_source("ohmyzsh/ohmyzsh.sh")
# install gtest
curl_source("gtest/install_gtest.sh")
# install gtest-runner
curl_source("gtest/install_gtest-runner.sh")

#install custom tools
git clone https://github.com/rise-lab-skku/src_generate_script.git "${HOME}/.custom_tools/psrcgen"
echo "alias psrcgen=\"source ${HOME}/.custom_tools/psrcgen/psrcgen.sh\"" >> ${HOME}/.zshrc
echo "alias psrcgen=\"source ${HOME}/.custom_tools/psrcgen/psrcgen.sh\"" >> ${HOME}/.bashrc
