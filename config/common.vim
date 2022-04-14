set nocompatible
let $LANG='en_Us'
set langmenu=en_Us
""let &t_SI.="\e[5 q" "SI = INSERT mode
""let &t_SR.="\e[4 q" "SR = REPLACE mode
""let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
set t_Co=256             " Use at least 256 colors
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
au BufRead,BufNewFile *.cuf set filetype=fortran
let mapleader ="\<space>"
autocmd BufEnter * hi Function guifg=#ccff00

set completeopt=menuone,longest,preview
set noerrorbells

"----------------------------------------------"
"         show tab as~, space as . 
"----------------------------------------------"
set listchars=tab:~~,trail:.
set list

"----------------------------------------------"
"         change file encoding as utf-8 
"----------------------------------------------"
set encoding=utf-8
set fileencoding=utf-8
set ambiwidth=double

"----------------------------------------------"
"          swap file 
"----------------------------------------------"
set noswapfile
set nobackup

"----------------------------------------------"
"         realative number 
"----------------------------------------------"
set relativenumber
set number

syntax on
set ruler
set noshowmode
set showcmd
set mouse=a
set selection=exclusive
set backspace=indent,eol,start
set autoindent
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set hlsearch
set incsearch
set cursorline
set inccommand=nosplit

set splitright
set splitbelow
set showmatch
set fdm=indent
set updatetime=100
set lazyredraw
set nowrap

aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
