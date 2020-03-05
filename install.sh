# install commonly used apt packages
source ./apt/common.sh

# copy .gitconfig
cp ./git/.gitconfig ${HOME}/.gitconfig

# install oh-my-zsh with zsh-autosuggestions and zsh-syntax-highlighting plugins
source ./ohmyzsh/ohmyzsh.sh

# install vim with Vundle plugins
source ./vim/install_vim.sh

