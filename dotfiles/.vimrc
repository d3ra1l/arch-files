" enable 256 colors
set t_Co=256

" turn on syntax highlighting
syntax on
filetype on
filetype plugin on

" colors
hi CursorLine ctermbg=7 cterm=bold
hi CursorLineNr ctermfg=238 ctermbg=235
hi LineNr ctermfg=7
hi Constant ctermfg=5
hi Statement ctermfg=1
hi TabLineFill term=bold cterm=bold ctermbg=none
hi TabLine ctermfg=7 ctermbg=none
hi TabLineSel ctermfg=Blue ctermbg=7
hi VertSplit ctermfg=235 ctermbg=235 cterm=none
hi StatusLine cterm=none ctermfg=0 ctermbg=7
hi StatusLineNC cterm=none ctermfg=7 ctermbg=235
hi Normal ctermfg=0 ctermbg=none
hi Directory ctermfg=4 cterm=none
hi User1 ctermfg=1 ctermbg=7
hi User2 ctermfg=2 ctermbg=7
hi User3 ctermfg=1 ctermbg=7
hi User4 ctermfg=12 ctermbg=7
hi User5 ctermfg=5 ctermbg=7

" set basic settings
set cursorline
set tabstop=4 
set smarttab
set shiftwidth=4
set nowrap
set noswapfile
set backspace=2
set shell=zsh\ -i
set spelllang=pl,en
set number
set scrolloff=5
set ruler               
set noerrorbells
set history=1000
set wildmenu
set wildmode=longest,list
set vb t_vb=
set mouse=
set fillchars+=vert:\ 
set laststatus=2

" set utf8
set encoding=utf8
set termencoding=utf-8

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
map s :s
map S :%s
map r :so $MYVIMRC<cr>
map R :so $MYVIMRC<cr>
map <C-o> :NERDTreeToggle<cr>
imap jk <Esc><Esc>
imap kj <Esc><Esc>
nmap w :w!<cr>
nmap q :q<cr>
nmap Q :q<cr>
noremap <F1> <Esc>
noremap ; :
noremap , ;
let mapleader=" "
noremap <leader>t :NERDTree<cr>
noremap <leader>j <C-W>j<cr>
noremap <leader>k <C-W>k<cr>
noremap <leader>l <C-W>l<cr>
noremap <leader>h <C-W>h<cr>
noremap <leader>r :!

" start searching as you type
set nohlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" backups
set backup
set backupdir=~/.vim/backup,/tmp

" persistent undo history
set undofile " Save undo's after file closes
set undodir=~/.vim/undo,/tmp " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=1000 " number of lines to save for undo

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif

" Remember info about open buffers on close
set viminfo^=%

" status line
"set statusline =
"set statusline +=%4*\ %<%F%*\ 			"full path
"set statusline +=%5*%{&ff}%*\           "file format
"set statusline +=%2*%m%*				"modified flag
"set statusline +=%3*%y%*                "file type
"set statusline +=%1*%=%5l%*             "current line
"set statusline +=%2*/%L%*\              "total lines
"set statusline +=%5*0x%04B\ %*          "character under cursor
"set noshowmode

" powerline settings
let g:Powerline_mode_n = 'N'
let g:Powerline_mode_i = 'I'
let g:Powerline_mode_R = 'R'
let g:Powerline_mode_v = 'V'
let g:Powerline_mode_V = 'V·L'
let g:Powerline_mode_cv = 'V·B'
let g:Powerline_mode_s = 'S'
let g:Powerline_mode_S = 'S·L'
let g:Powerline_mode_cs = 'S·B'
let g:Powerline_symbols = 'fancy'
let g:Powerline_colorscheme = 'custom'

" nerd tree
let NERDTreeShowHidden=0
let NERDTreeIgnore=['\.png$', '\.jpg$', '\.gif$', '\.tmp$', '\.swp$']
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" vundle
set nocompatible
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Lokaltog/vim-powerline'
Bundle 'danro/rename.vim'
Bundle 'scrooloose/nerdtree'
