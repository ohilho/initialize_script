# clone vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

## color themes
mkdir -p ${HOME}/.vim/colors && \
curl https://raw.githubusercontent.com/nanotech/jellybeans.vim/master/colors/jellybeans.vim > ${HOME}/.vim/colors/jellybeans.vim

# copy vimrc files
mkdir -p ${HOME}/.vim/vimrc.d/vundle.d
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vimrc > ${HOME}/.vimrc
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/custom.vim > ${HOME}/.vim/vimrc.d/custom.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/ctrlp.vim > ${HOME}/.vim/vimrc.d/vundle.d/ctrlp.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/nerdtree.vim > ${HOME}/.vim/vimrc.d/vundle.d/nerdtree.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/syntastic.vim > ${HOME}/.vim/vimrc.d/vundle.d/syntastic.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/syntax.vim > ${HOME}/.vim/vimrc.d/vundle.d/syntax.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/ultisnip.vim > ${HOME}/.vim/vimrc.d/vundle.d/ultisnip.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/vim-airline.vim > ${HOME}/.vim/vimrc.d/vundle.d/vim-airline.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/vim-fugitive.vim > ${HOME}/.vim/vimrc.d/vundle.d/vim-fugitive.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/vim-gitgutter.vim > ${HOME}/.vim/vimrc.d/vundle.d/vim-gitgutter.vim
curl https://raw.githubusercontent.com/ohilho/initialize_script/master/vim/copy_to_home/.vim/vimrc.d/vundle.d/ycm.vim > ${HOME}/.vim/vimrc.d/vundle.d/ycm.vim

# plugin install with vundle
vim +PluginInstall +qall

# compile You complete me
cd ${HOME}/.vim/bundle/YouCompleteMe
./install.py --clang-completer
