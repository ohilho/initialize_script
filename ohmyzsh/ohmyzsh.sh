#! /bin/bash
BASE_DIR=$(dirname "$0")
CUR_DIR=$(pwd)
URL="https://raw.githubusercontent.com/ohilho/initialize_script/master"
source <(curl -fsSL ${URL}/common.sh)

# dependent packages
apt_pkgs=(sed git zsh)
apt_install_array ${apt_pkgs}

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
sed 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/' ~/.zshrc > ~/.zshrc_tmp
sed 's\^ZSH_THEME.*\ZSH_THEME="powerlevel10k/powerlevel10k"\g' ~/.zshrc_tmp > ~/.zshrc
rm ~/.zshrc_tmp
