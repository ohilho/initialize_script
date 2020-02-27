"plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
Plugin 'gmarik/Vundle.vim'

for vimfile in split(globpath('~/.vim/vimrc.d/vundle.d', '*.vim'),'\n')
        exe 'source' vimfile
endfor
