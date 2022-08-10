#! /bin/bash

# @brief
#   Run command with 'sudo' when it is installed, else just run the command without 'sudo'.
#   In case there is no 'sudo' installed in base image, running 'sudo' makes 'command not found' error.
#
# @param $1 : command to run
function safe_sudo() {
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
function apt_install_array() {
    local pkg_list=$1
    safe_sudo "apt-get install -y ${pkg_list[@]}"
}

# @brief
#   run apt-get update with safe_sudo
#
function apt_update() {
    safe_sudo "apt-get update"
}

# @brief
#   download git configuration file
#
function download_gitconfig() {
    curl https://raw.githubusercontent.com/ohilho/initialize_script/master/resources/.gitconfig >${HOME}/.gitconfig
}

# @brief
#   download gtest from repository, build and install
#
function install_gtest() {
    # directory checkpoint
    CUR_DIR=$(pwd)

    # dependent packages
    if [ -n "$(which sudo)" ]; then
        # sudoer version
        sudo apt install git build-essential cmake -y
    else
        #root user
        apt install git build-essential cmake -y
    fi

    # clone gtest git repository
    git clone https://github.com/google/googletest.git googletest_download

    # build
    mkdir -p ./googletest_download/build && cd ./googletest_download/build && cmake .. && safe_sudo "make install"

    # clean up gtest dir
    rm -rf ${CUR_DIR}/googletest_download

    # return to the directory checkpoint
    cd ${CUR_DIR}
}

# @brief
#   Download oh-my-zsh and packages including:
#     - zsh-autosuggestions
#     - zsh-syntax-highlighting
#
#   Themes:
#     - powerlevel10k (default)
#
#   Fonts:
#     - MesloLGS
#
function install_oh_my_zsh() {
    # directory checkpoint
    CUR_DIR=$(pwd)

    # dependent packages
    if [ -n "$(which sudo)" ]; then
        # sudoer version
        sudo apt install sed git zsh -y
    else
        #root user
        apt install sed git zsh -y
    fi

    # install oh-my-zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh | sed "s/exec zsh.*//g")"

    # install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

    # install zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    # install powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

    # download fonts
    mkdir -p ${HOME}/.local/share/fonts
    wget -P ${HOME}/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
    wget -P ${HOME}/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
    wget -P ${HOME}/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
    wget -P ${HOME}/.local/share/fonts https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

    # Add plugins and themes to the .zshrc file
    sed 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc >~/.zshrc_tmp
    sed 's\^ZSH_THEME.*\ZSH_THEME="powerlevel10k/powerlevel10k"\g' ~/.zshrc_tmp >~/.zshrc
    rm ~/.zshrc_tmp

    # return to the directory checkpoint
    cd ${CUR_DIR}
}

function install_chrome() {
    if [ -n "$(which sudo)" ]; then
        # sudoer version
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
        sudo apt-get update
        sudo apt-get install google-chrome-stable -y
    else
        # root user version
        wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
        echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list
        apt-get update
        apt-get install google-chrome-stable -y
    fi
}

function install_ros_noetic() {
    if [ -n "$(which sudo)" ]; then
        # sudoer version
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
        sudo apt install curl -y
        curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
        sudo apt update
        sudo apt install ros-noetic-desktop-full -y
        if [ -n "$BASH" ]; then
            echo "source /opt/ros/noetic/setup.bash" >>~/.bashrc
            source ~/.bashrc
        fi
        if [ -n "$ZSH_NAME" ]; then
            echo "source /opt/ros/noetic/setup.zsh" >>~/.zshrc
            source ~/.zshrc
        fi
        sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
        sudo rosdep init
        rosdep update
    else
        # root user version
        sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
        apt install curl -y
        curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
        apt update
        apt install ros-noetic-desktop-full -y
        if [ -n "$BASH" ]; then
            echo "source /opt/ros/noetic/setup.bash" >>~/.bashrc
            source ~/.bashrc
        fi
        if [ -n "$ZSH_NAME" ]; then
            echo "source /opt/ros/noetic/setup.zsh" >>~/.zshrc
            source ~/.zshrc
        fi
        apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
        rosdep init
        rosdep update
    fi
}

function install_catkin_tools() {
    # install catkin tools
    if [ -n "$(which sudo)" ]; then
        # sudoer version
        sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
        wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
        sudo apt-get update
        sudo apt-get install python3-catkin-tools
    else
        # root user version
        sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -sc` main" > /etc/apt/sources.list.d/ros-latest.list'
        wget http://packages.ros.org/ros.key -O - | sudo apt-key add -
        apt-get update
        apt-get install python3-catkin-tools
    fi
}

function show_custom_functions() {
    echo "download_gitconfig()"
    echo "install_gtest()"
    echo "install_oh_my_zsh()"
}
