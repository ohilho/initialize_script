for vimfile in split(globpath('~/.vim/vimrc.d/', '*.vim'),'\n')
	exe 'source' vimfile
endfor
