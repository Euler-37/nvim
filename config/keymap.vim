let mapleader ="\<space>"
nnoremap <silent><leader><leader> /<++><CR>:nohlsearch<CR>c4l
"hi MatchParen ctermbg=red ctermfg=yellow
""braket complete
nnoremap <C-up> 5k
nnoremap <C-down> 5j
nnoremap <C-left> 10h
nnoremap <C-right> 10l

nnoremap <M-down> ddp
nnoremap <expr><M-up> line('.')== 1 ?'0':'ddkP'

inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
""complete
""key word complete
inoremap <M-k> <C-x><C-k>
""line complete
inoremap <M-l> <C-x><C-l>
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
"" buffer
nnoremap bb <C-6>
"" delete until end of line
inoremap <M-n> <ESC>$a
inoremap <M-m> <ESC>C
"" delete blank line and eol space
nnoremap ss :g/^$/d<CR>:nohl<CR>
nnoremap sn :%s/\s\+$//g<CR>:nohl<CR>
"" skip ()
nnoremap <M-b> %
inoremap <M-b> <Esc>%a
"" replace cursor word
nnoremap <M-r> :RepSub
"" update vimrc
nnoremap <leader>rc :vsplit $MYVIMRC<CR>
nnoremap <leader>rs :source $MYVIMRC<CR>
""add {['(" to a word
""nnoremap <M-'> viw<esc>a'<esc>hbi'<esc>lel
nnoremap <M-'> viwc''<ESC>hp
nnoremap <M-"> viwc""<ESC>hp
nnoremap <M-)> viwc()<ESC>hp
nnoremap <M-]> viwc[]<ESC>hp
nnoremap <M-}> viwc{}<ESC>hp
nnoremap <M-$> viwc$$<ESC>hp
inoremap <M-'> <ESC>viwc''<ESC>hpla
inoremap <M-"> <ESC>viwc""<ESC>hpla
inoremap <M-)> <ESC>viwc()<ESC>hpla
inoremap <M-]> <ESC>viwc[]<ESC>hpla
inoremap <M-}> <ESC>viwc{}<ESC>hpla
inoremap <M-$> <ESC>viwc$$<ESC>hpla
"(abcde)"
"" 'delete' a 'word' in 'insert' ['mode']
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
    nnoremap gcc 0i!!<ESC>
elseif expand("%:e") =~? '^\%(f\|for\)$'
    setlocal ic
    setlocal cc=6
    setlocal cc+=73
    hi ColorColumn guibg=lightgreen guifg=red
    setlocal tabstop=6
    setlocal softtabstop=6
    setlocal shiftwidth=6
elseif expand("%:e") =~? '^\%(c\|cpp\)$'
    inoremap { {}<left><CR><CR><up><BS><CR>
    nnoremap gcc 0i//<ESC>
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
    endif
endfunc


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
