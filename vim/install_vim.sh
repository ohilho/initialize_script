# remove pre-installed binary distribution
sudo apt remove vim vim-runtime gvim -y;

# copy configuration files
cp -r ./copy_to_home/.vim ${HOME}/.vim
cp -r ./copy_to_home/.vimrc ${HOME}/.vimrc

# install dependencies
sudo apt install \
libncurses5-dev libgnome2-dev libgnomeui-dev libgtk2.0-dev libatk1.0-dev \
libbonoboui2-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git libxtst-dev \
ctags cscope -y;

# clone git repository
git clone https://github.com/vim/vim.git vim_github;

# change dir to local repository
cd vim_github;

# configure build options
./configure --with-features=huge \
--enable-fail-if-missing \
--enable-multibyte \
--enable-rubyinterp=yes \
--enable-python3interp=yes \
--with-python-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu \
--enable-perlinterp=yes \
--enable-luainterp=yes \
--enable-gui=gtk2 \
--enable-cscope --prefix=/usr/local

# run make install
sudo make install

# overide system default editor
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1 && \
sudo update-alternatives --set editor /usr/bin/vim && \
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1 && \
sudo update-alternatives --set vi /usr/bin/vim

# make .vim directory
mkdir -p ${HOME}/.vim


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
vim +PluginInstall

# compile You complete me
cd ${HOME}/.vim/bundle/YouCompleteMe
sudo apt install cmake -y
./install.py --clang-completer

