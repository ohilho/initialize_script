# install commonly used apt packages
source ./apt/common.sh

# copy configurations
cp ./git/.gitconfig ${HOME}/.gitconfig
cp -r ./vim/copy_to_home/.vim ${HOME}/.vim
cp .vim/copy_to_home/.vimrc ${HOME}/.vimrc_tmp

# install oh-my-zsh with zsh-autosuggestions and zsh-syntax-highlighting plugins
source ./ohmyzsh/ohmyzsh.sh

# install vim with Vundle plugins
source ./vim/install_vim.sh

