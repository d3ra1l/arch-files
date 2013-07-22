" enable 256 colors
set t_Co=256

" turn on syntax highlighting
syntax on
filetype on
filetype plugin on

hi CursorLine ctermbg=235 cterm=bold
hi CursorLineNr ctermfg=238 ctermbg=235
hi LineNr ctermfg=238
hi VertSplit ctermfg=235
hi Constant ctermfg=5
hi Statement ctermfg=1

" set basic settings
set tabstop=4
set shiftwidth=4
set nowrap
set noswapfile
set backspace=2
set shell=zsh
set hlsearch
set spelllang=pl,en

" key bindings
cmap w!! %!sudo tee > /dev/null %
map K <C-u>
map J <C-d>
map <C-o> :Explore<Return>

" start searching as you type
set incsearch
set ignorecase
set smartcase

" persistent undo history
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
