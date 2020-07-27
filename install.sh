# if you are root user and you don't have sudo yet...
apt update;
apt upgrade -y;
apt install sudo -y;

# install commonly used packages
sudo apt update;
sudo apt upgrade -y;
sudo apt install build-essential git cmake zsh wget curl -y

# # install commonly used apt packages
# source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/master/apt/common.sh)

# copy git configurations
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/git/.gitconfig > ${HOME}/.gitconfig

# install oh-my-zsh with zsh-autosuggestions and zsh-syntax-highlighting plugins
source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/master/ohmyzsh/ohmyzsh.sh)

# install gtest
source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/master/gtest/install_gtest.sh)

# install vim
source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/install_vim.sh)
source <(curl -fsSL https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/install_plugins.sh)

#install psrcgen
git clone https://github.com/rise-lab-skku/src_generate_script.git "${HOME}/.custom_tools/psrcgen"
echo "alias psrcgen=\"source ${HOME}/.custom_tools/psrcgen/psrcgen.sh\"" >> ${HOME}/.zshrc
