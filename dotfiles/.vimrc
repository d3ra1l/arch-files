" enable 256 colors
set t_Co=256

" turn on syntax highlighting
syntax on
filetype on
filetype plugin on

" fix colors
hi CursorLine ctermbg=235 cterm=bold
hi CursorLineNr ctermfg=238 ctermbg=235
hi LineNr ctermfg=238
hi VertSplit ctermfg=235
hi Constant ctermfg=5
hi Statement ctermfg=1
hi TabLineFill term=bold cterm=bold ctermbg=none
hi TabLine ctermfg=15 ctermbg=none
hi TabLineSel ctermfg=Blue ctermbg=7

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
map L :tabnext<cr>
map H :tabprev<cr>
map t :tabf 
map T :Texplore<cr>
map j gj
map k gk
map r :so $MYVIMRC<cr>
map <C-o> :Explore<Return>
nmap w :w!<cr>
nmap q :q!<cr>
inoremap jk <Esc>
inoremap kj <Esc>
noremap <F1> <Esc>

"
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

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif

" Remember info about open buffers on close
 set viminfo^=%

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
