# install commonly used apt packages
source ./apt/common.sh

# copy configurations
cp ./git/.gitconfig ${HOME}/.gitconfig

# install oh-my-zsh with zsh-autosuggestions and zsh-syntax-highlighting plugins
source ./ohmyzsh/ohmyzsh.sh

# install vim
source ./vim/install_vim.sh
echo $(pwd)

cp -r ./vim/copy_to_home/.vim ${HOME}/.vim
cp ./vim/copy_to_home/.vimrc ${HOME}/.vimrc

source ./vim/install_plugins.sh

