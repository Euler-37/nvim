nnoremap <silent><leader><leader> /<++><CR>:nohlsearch<CR>c4l

"------------------------------------------------------------"
"                exchange  line or word
"------------------------------------------------------------"
nnoremap <expr><C-up> line('.')== 1 ?'0':'ddkP'
nnoremap <C-down> ddp
nnoremap <C-right> xp
nnoremap <C-left> xhP

"------------------------------------------------------------"
"                fast move
"------------------------------------------------------------"
nnoremap <M-i> 5<up>
nnoremap <M-k> 5<down>
nnoremap <M-j> 10<left>
nnoremap <M-l> 10<right>

"------------------------------------------------------------"
"                 braket completion
"------------------------------------------------------------"
inoremap ' ''<left>
inoremap " ""<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>

"------------------------------------------------------------"
"                 line completion
"------------------------------------------------------------"
inoremap <C-l> <C-x><C-l>

"------------------------------------------------------------"
"                move to next line in insert mode
"------------------------------------------------------------"
inoremap <M-o> <ESC> o

"------------------------------------------------------------"
"                split
"------------------------------------------------------------"
nnoremap <S-up> :res +5<CR>
nnoremap <S-down> :res -5<CR>
nnoremap <S-left> :vertical res -5<CR>
nnoremap <S-right> :vertical res +5<CR>
tnoremap <M-s> <C-w><C-w>
nnoremap <M-s> <C-w><C-w>

"------------------------------------------------------------"
"                yank paste
"------------------------------------------------------------"
nnoremap <M-v> "+gp
vnoremap Y "+y<CR>

"------------------------------------------------------------"
"                tab move
"------------------------------------------------------------"
nnoremap <expr><TAB> col('.')== col('$')-1 ?'^':'$'
vnoremap <expr><TAB> col('.')== col('$')-1 ?'^':'$'


"------------------------------------------------------------"
"                move block
"------------------------------------------------------------"
nnoremap <M-b> %
inoremap <M-b> <Esc>%a

"------------------------------------------------------------"
"                delete blank line
"------------------------------------------------------------"
nnoremap <M-d>b :%s/\s\+$//g<CR>:nohl<CR>
nnoremap <M-d>bl :g/^$/d<CR>:nohl<CR>

"------------------------------------------------------------"
"                replace sub word under cursor
"------------------------------------------------------------"
nnoremap <M-r> :RepSub


"------------------------------------------------------------"
"                vimrc
"------------------------------------------------------------"
nnoremap <leader>rc :vsplit $MYVIMRC<CR>
nnoremap <leader>rs :source $MYVIMRC<CR>
"------------------------------------------------------------"
"         add {['(" to a word
"------------------------------------------------------------"

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
nnoremap <M-d>$ F$lvf$hxa<BS><BS><ESC>pl
inoremap <M-d>$ <ESC>F$lvf$hxa<BS><BS><ESC>pla

"------------------------------------------------------------"
"delete  a word in insert mode
"------------------------------------------------------------"
inoremap <M-w> <esc>ciw
nnoremap <M-w> ciw

"------------------------------------------------------------"
"  vim visual block 
"------------------------------------------------------------"
nnoremap m2 <C-v>1jI
nnoremap m3 <C-v>2jI
nnoremap m4 <C-v>3jI
nnoremap m5 <C-v>4jI
nnoremap m6 <C-v>5jI
nnoremap m7 <C-v>6jI
nnoremap m8 <C-v>7jI
nnoremap m9 <C-v>8jI

"------------------------------------------------------------"
"  iab
"------------------------------------------------------------"
iab edn end
iab ture true
iab mian main

"------------------------------------------------------------"
"  comment
"------------------------------------------------------------"
autocmd FileType c nnoremap <buffer> ' ^i//<ESC>j
autocmd FileType c nnoremap <buffer> " ^xxj
autocmd FileType cpp nnoremap <buffer> ' ^i//<ESC>j
autocmd FileType cpp nnoremap <buffer> " ^xxj
autocmd FileType fortran nnoremap <buffer> ' ^i!<ESC>j
autocmd FileType fortran vnoremap <buffer> ' ^I!<ESC>j
autocmd FileType fortran nnoremap <buffer> " ^xj
autocmd FileType fortran inoremap <buffer> ; %
autocmd FileType python nnoremap <buffer> ' ^i#<ESC>j
autocmd FileType python nnoremap <buffer> " ^xj

"------------------------------------------------------------"
"          special for different languages
"------------------------------------------------------------"
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
elseif expand("%:e") =~? '^\%(f\|for\)$'
    setlocal ic
    setlocal cc=6,73
    hi ColorColumn guibg=green guifg=white 
    setlocal tabstop=2
    setlocal softtabstop=2
    setlocal shiftwidth=2
elseif expand("%:e") =~? '^\%(c\|cpp\)$'
    inoremap { {}<left><CR><CR><up><BS><CR>
endif

"------------------------------------------------------------"
"          $ object  $abnc$  c, y ,d 
"------------------------------------------------------------"
onoremap i$ :<c-U>normal!F$lv,h<CR>
onoremap a$ :<c-U>normal!F$v,<CR>


"------------------------------------------------------------"
"          makefile
"------------------------------------------------------------"
if expand("%:e") == "f90"
    setlocal signcolumn=yes
    setlocal makeprg=gfortran\ %\ -Wall\ -fopenmp\ -fcheck=all\ -ffpe-trap=invalid,denormal,zero,overflow,underflow\ -g\ -fbacktrace\ -o\ t1
elseif expand("%:e")== "c"
    setlocal signcolumn=yes
    setlocal makeprg=gcc\ %\ -Wall\ -o\ t1
elseif expand("%:e")== "cpp"
    setlocal signcolumn=yes
    setlocal makeprg=g++\ %\ -Wall\ -o\ t1
elseif expand("%:e")== "py"
    setlocal signcolumn=yes
    setlocal makeprg=python\ %
elseif expand("%:e")== "tex"
    setlocal signcolumn=yes
    setlocal makeprg=xelatex.exe\ -synctex=1\ --interaction=nonstopmode\ %
endif


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
"    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
"        return "\<Tab>"
"    else
"        return "\<C-p>"
"    endif
"endfunction
""inoremap <Tab> <C-R>=CleverTab()<CR>
""nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<cr>g@
""vnoremap <leader>g :<c-u>call <SID>GrepOperator(visualmode())<cr>
""
""function! s:GrepOperator(type)
""    let saved_unnamed_register = @@
""
""    if a:type ==# 'v'
""        normal! `<v`>y
""    elseif a:type ==# 'char'
""        normal! `[v`]y
""    else
""        return
""    endif
""
""    silent execute "grep! -R " . shellescape(@@) . " ."
""    copen
""
""    let @@ = saved_unnamed_register
""endfunction

