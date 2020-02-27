# vim_plugins.sh
# make .vim directory
mkdir -p ~/.vim

cp -r $(dirname "$0")/copy_to_home/.vim ~/
cp -r $(dirname "$0")/copy_to_home/.vimrc ~/


# clone vundle
mkdir ~/.vim/bundle && \
cd ~/.vim/bundle && \
git clone https://github.com/VundleVim/Vundle.vim.git

## taglist
# install dependencies
sudo apt install exuberant-ctags -y;

## color themes
mkdir ~/.vim/colors && \
cd ~/.vim/colors && \
wget https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim \
wget https://raw.githubusercontent.com/chrishunt/color-schemes/master/railscasts/base16-railscasts.vim

# plugin install with vundle
vim +PluginInstall

# compile You complete me
cd ~/.vim/bundle/YouCompleteMe
sudo apt install cmake -y
./install.py --clang-completer