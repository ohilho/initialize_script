# clone vundle
mkdir -p ${HOME}/.vim/bundle && \
cd ${HOME}/.vim/bundle && \
git clone https://github.com/VundleVim/Vundle.vim.git

## taglist
# install dependencies
sudo apt install exuberant-ctags -y;

## color themes
mkdir -p ${HOME}/.vim/colors && \
cd ${HOME}/.vim/colors && \
wget https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim

# plugin install with vundle
mv ${HOME}/.vimrc_tmp ${HOME}/.vimrc
vim +PluginInstall +qall

# compile You complete me
cd ${HOME}/.vim/bundle/YouCompleteMe
sudo apt install cmake -y
./install.py --clang-completer

