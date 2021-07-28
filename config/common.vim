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
"
""fortranMultiCommentLines
""syn match Function /\<default\ze\_s\+\(subroutine\|function\|type\)\>/
""syn match fortranFunction "\<[a-zA-Z_][a-zA-Z_0-9]*\>[^()]*)("me=e-2
""hi cFunctions gui=NONE cterm=bold  ctermfg=blue
autocmd BufEnter * hi Function guifg=#ccff00
autocmd FileType * call LoadDict()
autocmd FileType fortran call Run()
autocmd FileType c call Run()
autocmd FileType cpp call Run()
autocmd FileType python call Run()
""set pythonthreedll=python38.dll
set ofu=syntaxcomplete#Complete
autocmd FileType python3 set omnifunc=python3complete#Complete
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd Filetype fortran setlocal formatprg=fprettify\ --silent\ --indent\ 4\ --whitespace\ 1
""autocmd BufEnter * :set conceallevel=0
set completeopt=menuone,longest,preview
set noerrorbells
""tab and space show
set listchars=tab:~~,trail:.
set list
""set guifont=JetBrains_Mono_medium:h14:W500:cANSI:qDRAFT
""set guifont=CaskaydiaCove_Nerd_Font_Mono:h14:cANSI:qDRAFT
"let &t_ut=''
set encoding=utf-8
""set encoding=utf-8
set fileencoding=utf-8
set ambiwidth=double
"set fileencodings=utf-8,gb18030,utf-16,big5
set number
set relativenumber
syntax on
set ruler
set noshowmode
set showcmd
""mouse
set mouse=a
set selection=exclusive
"set paste
""backspace and indent
set backspace=indent,eol,start
set autoindent
""tab and space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
""search
set hlsearch
set incsearch
set cul
set inccommand=nosplit
"set spell spelllang=en_us
set noswapfile
set nobackup
""set scrolloff=999
""set cursorline
set splitright
set showmatch
set fdm=indent
""set foldopen=all
""set foldclose=all
set updatetime=100
set lazyredraw
set nowrap
set dictionary=/mnt/g/software/Vim/vimfiles/dict/chinese.dict
set clipboard+=unnamed
set clipboard+=unnamedplus
""set cindent
""set cinoptions={0,1s,t0,n-2,p2s,(03s,=,5s,>1s,=1s,:1s)}
func! LoadDict()
    silent exec "setlocal dictionary+=/mnt/g/software/Vim/vimfiles/dict/".expand("%:e").".dict"
endfunc
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END

command! -nargs=1 Hex call ConvertHex(<f-args>)

function! ConvertHex(kind)
python3 << EOF
import vim
import struct
import re

def Convert_Hex():
    kind=int(vim.eval("a:kind"))
    dict={4:('>f','>i','<f','<i'),8:('>d','>q','<d','<q')}
    cb = vim.current.buffer
    cw = vim.current.window
    (col,row) = cw.cursor
    line=cb[col-1]
    word=line[row:row+20]
    if " " in word:
        word=word.replace(" ","")
    len_word=len(word)
    if len_word<kind*2:
        word=(kind*2-len_word)*"0"+word
    else:
        word=word[0:kind*2]
    if re.findall(r'[^0-9a-fA-F]',word):
        print(re.findall(r'[^0-9a-fA-F]',word))
        print("NOT a HEX")
        return
    print("kind=:",kind,"Hex=:",word)
    (_fb,_ib,_fl,_il)=dict[kind]
    print("float,   big-endian:",struct.unpack(_fb, bytes.fromhex(word))[0])
    print("int  ,   big-endian:",struct.unpack(_ib, bytes.fromhex(word))[0])
    print("float,little-endian:",struct.unpack(_fl, bytes.fromhex(word))[0])
    print("int  ,little-endian:",struct.unpack(_il, bytes.fromhex(word))[0])
Convert_Hex()
EOF
endfunction
