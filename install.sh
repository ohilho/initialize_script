#! /bin/bash
source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/feature/safe_sudo/common.sh)

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
