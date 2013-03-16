" turn on syntax highlighting
syntax on

" set basic settings
set nowrap
set noswapfile
set backspace=2

" powerline
set nocompatible
"filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set laststatus=2
let g:Powerline_symbols = 'unicode'

" vundle
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
" set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
