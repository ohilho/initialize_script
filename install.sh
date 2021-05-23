#! /bin/bash

URL="https://raw.githubusercontent.com/ohilho/initialize_script/master"
source <(curl -fsSL ${URL}/common.sh)

# set defualt gitconfig
source <(curl -fsSL ${URL}/git/install_gitconfig.sh)
# # install oh-my-zsh with some plugins
source <(curl -fsSL ${URL}/ohmyzsh/ohmyzsh.sh)
# # install gtest
source <(curl -fsSL ${URL}/gtest/install_gtest.sh)

#install custom tools
git clone https://github.com/rise-lab-skku/src_generate_script.git "${HOME}/.custom_tools/psrcgen"
echo "alias psrcgen=\"source ${HOME}/.custom_tools/psrcgen/psrcgen.sh\"" >> ${HOME}/.zshrc
echo "alias psrcgen=\"source ${HOME}/.custom_tools/psrcgen/psrcgen.sh\"" >> ${HOME}/.bashrc
