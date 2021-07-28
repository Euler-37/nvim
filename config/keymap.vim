let mapleader ="\<space>"
nnoremap <silent><leader><leader> /<++><CR>:nohlsearch<CR>c4l
"""hi MatchParen ctermbg=red ctermfg=yellow
""""braket complete
nnoremap <expr><C-up> line('.')== 1 ?'0':'ddkP'
nnoremap <C-down> ddp
nnoremap <C-right> xp
nnoremap <C-left> xhP
""
"noremap i k
"noremap k j
"noremap j h
"noremap h i
""
inoremap <M-i> <up>
inoremap <M-k> <down>
inoremap <M-j> <left>
inoremap <M-l> <right>
inoremap <M-I> <up><up><up><up><up>
inoremap <M-K> <down><down><down><down><down>
inoremap <M-J> <left><left><left><left><left>
inoremap <M-L> <right><right><right><right><right>
""
inoremap <M-h> <Backspace>

nnoremap <M-i> 5<up>
nnoremap <M-k> 5<down>
nnoremap <M-j> 10<left>
nnoremap <M-l> 10<right>

inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
""inoremap ) <c-r>=ClosePair(')')<CR>
""inoremap ] <c-r>=ClosePair(']')<CR>
""inoremap } <c-r>=ClosePair('}')<CR>
function! ClosePair(char)
    if getline('.')[col('.')-1]==a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction
""complete
""key word complete
inoremap <C-k> <C-x><C-k>
""line complete
inoremap <C-l> <C-x><C-l>
""dict complete
inoremap <M-p> <C-x><C-o>
""jump
inoremap <M-o> <ESC> o
""termial
nnoremap <S-up> :res +5<CR>
nnoremap <S-down> :res -5<CR>
nnoremap <S-left> :vertical res -5<CR>
nnoremap <S-right> :vertical res +5<CR>
tnoremap <M-s> <C-w><C-w>
nnoremap <M-s> <C-w><C-w>
nnoremap <F5> :vert term<CR><C-w><C-w><CR>:vertical res +20<CR><C-w><C-w>
""paste copy
nnoremap <M-v> "+gp
nnoremap <M-c> "+y<CR>
""skip
nnoremap <expr><TAB> col('.')== col('$')-1 ?'^':'$'
vnoremap <expr><TAB> col('.')== col('$')-1 ?'^':'$'
"" buffer
""nnoremap bb <C-6>
"" delete until end of line
inoremap <M-n> <ESC>A
inoremap <M-m> <ESC>C
"" delete blank line and eol space
nnoremap <M-d>b :%s/\s\+$//g<CR>:nohl<CR>
nnoremap <M-d>bl :g/^$/d<CR>:nohl<CR>
"" skip ()
nnoremap <M-b> %
inoremap <M-b> <Esc>%a
"" replace cursor word
nnoremap <M-r> :RepSub
"" update vimrc
nnoremap <leader>rc :vsplit $MYVIMRC<CR>
nnoremap <leader>rs :source $MYVIMRC<CR>
""add {['(" to a word
nnoremap <M-'> ciw''<ESC>Pl
nnoremap <M-"> ciw""<ESC>Pl
nnoremap <M-(> ciw()<ESC>Pl
nnoremap <M-[> ciw[]<ESC>Pl
nnoremap <M-{> ciw{}<ESC>Pl
nnoremap <M-$> ciw$$<ESC>Pl
inoremap <M-'> <ESC>ciw''<ESC>Pla
inoremap <M-"> <ESC>ciw""<ESC>Pla
inoremap <M-(> <ESC>ciw()<ESC>Pla
inoremap <M-[> <ESC>ciw[]<ESC>Pla
inoremap <M-{> <ESC>ciw{}<ESC>Pla
inoremap <M-$> <ESC>ciw$$<ESC>Pla
vnoremap <M-'> c''<ESC>Pla
vnoremap <M-"> c""<ESC>Pla
vnoremap <M-(> c()<ESC>Pla
vnoremap <M-[> c[]<ESC>Pla
vnoremap <M-{> c{}<ESC>Pla
vnoremap <M-$> c$$<ESC>Pla

nnoremap <M-d>) ci(<right><bs><bs><ESC>pl
nnoremap <M-d>] ci[<right><bs><bs><ESC>pl
nnoremap <M-d>} ci{<right><bs><bs><ESC>pl
inoremap <M-d>) <esc>ci(<right><bs><bs><ESC>pla
inoremap <M-d>] <esc>ci[<right><bs><bs><ESC>pla
inoremap <M-d>} <esc>ci{<right><bs><bs><ESC>pla
nnoremap <M-d>" ci"<right><bs><bs><ESC>pl
nnoremap <M-d>' ci'<right><bs><bs><ESC>pl
inoremap <M-d>" <esc>ci"<right><bs><bs><ESC>pla
inoremap <M-d>' <esc>ci'<right><bs><bs><ESC>pla
"()"
""delete  a 'word' in 'insert' ['mode']
inoremap <M-w> <esc>ciw
nnoremap <M-w> ciw
nnoremap <M-o> i<cr>
nnoremap m2 <C-v>1jI
nnoremap m3 <C-v>2jI
nnoremap m4 <C-v>3jI
nnoremap m5 <C-v>4jI
nnoremap m6 <C-v>5jI
nnoremap m7 <C-v>6jI
nnoremap m8 <C-v>7jI
nnoremap m9 <C-v>8jI
"" g+<Ctrl A>
"" gv choose last chosen
nnoremap <F5> :Run<CR>
if expand("%:e") =~? '^\%(tex\|md\)$'
    inoremap $ $$<left>
    iab b \begin{<right>
elseif expand("%:e") == "f90"
    setlocal ic
    let fortran_have_tabs=1
    let fortran_free_source=1
    let fortran_more_precise=1
    let fortran_do_enddo=1
    let fortran_indent_more=1
    nnoremap ' ^i!<ESC>
    vnoremap ' ^I!<ESC>
    nnoremap " ^x<ESC>
elseif expand("%:e") =~? '^\%(f\|for\)$'
    setlocal ic
    setlocal cc=6
    setlocal cc+=73
    hi ColorColumn guifg=#5369e5 guibg=#ff0f3b
    ""hi ColorColumn guifg=black guibg=white
    ""hi ColorColumn ctermfg=#5369e5 ctermbg=#ff0f3b
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
elseif expand("%:e") =~? '^\%(c\|cpp\)$'
    inoremap { {}<left><CR><CR><up><BS><CR>
    nnoremap ' ^i//<ESC>
    nnoremap " ^xx<ESC>
endif

func! Run()
    exec "w"
    setlocal signcolumn=yes
    if expand("%:e") == "f90"
        setlocal makeprg=gfortran\ %\ -Wall\ -fopenmp\ -fcheck=all\ -o\ t1
    elseif expand("%:e")== "c"
        setlocal makeprg=gcc\ %\ -Wall\ -o\ t1
    elseif expand("%:e")== "cpp"
        setlocal makeprg=g++\ %\ -Wall\ -o\ t1
    elseif expand("%:e")== "py"
        setlocal makeprg=python\ %
    elseif expand("%:e")== "tex"
        setlocal makeprg=xelatex.exe\ -synctex=1\ --interaction=nonstopmode\ %
    endif
endfunc
command! -nargs=0 Run call Run()


func! RepSub(para)
    let word=expand('<cword>')
    exec "normal {"
    let codenumber0=string(line('.'))
    exec "normal }"
    let codenumber1=string(line('.'))
    exec ":".codenumber0.",".codenumber1."s/\\<".word."\\>/".a:para."/g"
endfunc
command! -nargs=1 RepSub call RepSub(<f-args>)

func! RepAll(para)
    let word=expand('<cword>')
    exec ":%s/\\<".word."\\>/".a:para."/g"
endfunc
command! -nargs=1 RepAll call RepAll(<f-args>)

func! Del()
    let word=expand('<cword>')
    exec ":%s/\\<".word."\\>//g"
endfunc
command! -nargs=0 Del call Del()

func! Fortran77()
    exec ":%s/\\.le\\./<=/g"
    exec ":%s/\\.ge\\./>=/g"
    exec ":%s/\\.gt\\./>/g"
    exec ":%s/\\.lt\\./</g"
    exec ":%s/\\.eq\\./==/g"
    exec ":%s/\\.ne\\./\\/=/g"
endfunc
command! -nargs=0 F77 call Fortran77()




"function! CleverTab()
"        if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"                return "\<Tab>"
"        else
"                return "\<C-N>"
"        endif
"endfunction
"inoremap <Tab> <C-R>=CleverTab()<CR>
