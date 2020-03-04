" Text Editor Helper
set mouse=a
set autoindent
set cindent
set ts=4
set shiftwidth=4
set clipboard=unnamedplus

" Apearance
set nu
set title
set t_Co=256
set background=dark
colorscheme jellybeans
syntax on

" Auto Generate CTags
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &

" Delete trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Vundle plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

for vimfile in split(globpath('~/.vim/vimrc.d/vundle.d', '*.vim'),'\n')
        exe 'source' vimfile
endfor
call vundle#end()
filetype on

