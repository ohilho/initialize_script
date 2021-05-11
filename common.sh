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
