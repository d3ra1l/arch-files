" enable 256 colors
set t_Co=256

" turn on syntax highlighting
syntax on
filetype on
filetype plugin on
filetype indent on

" set basic settings
set nowrap
set noswapfile
set backspace=2
set mouse=a
set shell=zsh
set hlsearch
set spelllang=pl,en
"set cursorline

" smart tabs
set expandtab
set smarttab

" start searching as you type
set incsearch
set ignorecase
set smartcase

" persistend undo history
if has('persistent_undo')
    set undofile " Save undo's after file closes
    set undodir=~/.vim/undo " where to save undo histories
    set undolevels=100 " How many undos
    set undoreload=1000 " number of lines to save for undo
endif

" powerline
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
set laststatus=2
let g:Powerline_symbols = 'fancy'

" vundle
Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-surround'
