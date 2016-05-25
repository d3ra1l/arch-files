"""""""""""
"" vimrc ""
"""""""""""

" General {{{
"---------------

" basic settings
set nocompatible
set wrap
set noswapfile
set backspace=indent,eol,start
set foldmethod=marker
set number
set scrolloff=5
set noerrorbells
set history=1000
set wildmenu
set wildmode=longest,list
set vb t_vb=
set mouse=
set fillchars+=vert:\
set list 
set listchars=tab:\|\ 
set laststatus=2
set splitright
set splitbelow
set autochdir
set autoindent

" tab settings (as in the key)
set smarttab
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2

" enable utf8
set encoding=utf8
set termencoding=utf-8

" searching
set nohlsearch
set incsearch
set ignorecase
set smartcase

" backups
set backup
set backupdir=~/.vim/backup,/tmp
set directory=~/.vim/tmp

" persistent undo history
set undofile " Save undo's after file closes
set undodir=~/.vim/undo,/tmp " where to save undo histories
set undolevels=1000 " How many undos
set undoreload=1000 " number of lines to save for undo

" highlight current position
set cursorline
set cursorcolumn

" source .vimrc
autocmd vimenter * source $MYVIMRC

" return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif

" disable auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set formatoptions-=cro

" turn on syntax highlighting
syntax on

" }}}

" Key bindings {{{
"--------------------

cmap w!! %!sudo tee > /dev/null %
map K <C-u>
map J <C-d>
map L W
map H B
map r :so $MYVIMRC<cr>
map R :so $MYVIMRC<cr>
nmap <C-o> :NERDTreeToggle<cr>
nmap <C-b> :TagbarToggle<cr>
imap jk <Esc><Esc>
imap kj <Esc><Esc> 
nmap q :q<cr>
nmap Q :wq<cr>
nmap <C-v> V
noremap j gj
noremap k gk
nnoremap ; :
nnoremap , ;
nnoremap n nzz
nnoremap < <<
nnoremap > >>
vnoremap > >gv
vnoremap < <gv
noremap <Space> <Nop>
let mapleader=" "
noremap <leader>o o<Esc>
noremap <leader>O O<Esc>
noremap <leader>j <C-W>j
noremap <leader>k <C-W>k
noremap <leader>l <C-W>l
noremap <leader>h <C-W>h
noremap <leader>A 8 <C-w><
noremap <leader>D 8 <C-w>-
noremap <leader>S 8 <C-w>+
noremap <leader>F 8 <C-w>>
noremap <leader><Space> za
noremap <leader>f zf
noremap <leader>L :tabnext<cr>
noremap <leader>H :tabprev<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>p m[vab:sleep 550m<CR>`[
nmap <Return> o<Esc><Esc>
nmap <S-Return> O<Esc><Esc>
nmap <leader>n <Plug>SneakNext
nmap <leader>N <Plug>SneakPrev

" }}}

" Plugins {{{
"---------------

" vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
filetype off
filetype plugin on

Bundle 'mhniz/vim-startify'
Bundle 'danro/rename.vim'
Bundle 'majustsuhi/tagbar' 
Bundle 'Raimondi/delimitMate'
Bundle 'justinmk/vim-sneak'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

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
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#RemoveSegment('filesize')
call Pl#Theme#RemoveSegment('raw')
call Pl#Theme#RemoveSegment('lineinfo')

" tagbar
let g:tagbar_width = '20'
let g:tagbar_show_linenumbers = '0'
let g:tagbar_iconchars =[' ▸', ' ▾']

" nerd tree
let NERDTreeShowHidden=0
let NERDChristmasTree=1
let NERDTreeShowBookmarks=0
let NERDTreeMinimalUI=0
let NERDTreeIgnore=['\.png$', '\.jpg$', '\.gif$', '\.tmp$', '\.swp$']
let NERDTreeStatusline= '-1'
let g:NERDTreeWinSize = '15'
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

" identline
let g:indentLine_char = '│'
let g:indentLine_color_term = 7

" delimitmate
au FileType scheme let b:delimitMate_quotes = "\" "
au FileType vim let b:delimitMate_quotes = "\' "
let delimitMate_expand_cr=1

" vicle
au FileType scheme let t:vicle_screen_sn = 'racket'
au FileType lua let t:vicle_screen_sn = 'lua'
au FileType sh let t:vicle_screen_sn = 'zsh'
au FileType * let t:vicle_screen_wn = '0'

" }}}

" Colors {{{
"--------------

set t_Co=256
hi CursorLine ctermbg=7 cterm=bold
hi CursorLineNr ctermfg=238 ctermbg=235
hi LineNr ctermfg=7
hi Constant ctermfg=2
hi Statement ctermfg=1
hi MatchParen ctermfg=8 ctermbg=white cterm=none
hi TabLineFill term=bold cterm=bold ctermbg=235
hi TabLine ctermfg=15 ctermbg=235 cterm=none
hi TabLineSel ctermfg=Black ctermbg=none cterm=none
hi VertSplit ctermfg=235 ctermbg=235 cterm=none
hi StatusLine cterm=none ctermfg=0 ctermbg=7
hi StatusLineNC cterm=none ctermfg=235 ctermbg=235
hi Normal ctermfg=0 ctermbg=none
hi Directory ctermfg=4 cterm=none
hi Folded ctermbg=235 cterm=none
hi SpecialKey ctermfg=7
hi Nontext ctermfg=7
hi TagbarIcon ctermfg=red cterm=none
hi TagbarHighlight ctermfg=red ctermbg=none
hi TagbarScope ctermfg=blue ctermbg=none cterm=none
hi TagbarKind ctermfg=blue ctermbg=none cterm=none
hi TagbarNestedKind ctermbg=blue ctermbg=none cterm=none

" }}}
