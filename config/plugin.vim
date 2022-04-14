
"---------------------------------------------------------------"
" Plugin
"---------------------------------------------------------------"
let g:plug_threads=4
call plug#begin('~/.vim/plugged')
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'dominikduda/vim_current_word'
Plug 'voldikss/vim-floaterm'
Plug 'godlygeek/tabular'
Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'terryma/vim-expand-region'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },'for': ['markdown', 'plug']}
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'xolox/vim-misc'
Plug 'Euler-37/vim-easytags'
Plug 'michaeljsmith/vim-indent-object'
Plug 'github/copilot.vim'
Plug 'tpope/vim-markdown',{'for':['markdown','plug']}
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'Euler-37/forsub.vim',{'for':['fortran','plug']}
Plug 'Euler-37/Hex.vim'
call plug#end()

"---------------------------------------------------------------"
"                    lightline
"---------------------------------------------------------------"
set laststatus=2
let g:lightline = {
            \ 'colorscheme' : 'sonokai',
            \ 'active'      : {
                \ 'left'    : [ [ 'mode', 'paste'],
                \               [ 'readonly', 'filename', 'modified'],
                \               ['time'] ],
                \ 'right'   : [ ['lineinfo','lineall'],
                \               [ 'percent' ],
                \               [ 'git','fileformat', 'fileencoding', 'filetype' ] ]
                \ },
                \ 'component_function': {
                    \   'time':'Showtime',
                    \   'git':'GitInfo',
                    \   'lineall':'ShowLine'
                    \ }
                    \ }
"let g:lightline.subseparator = {
"            \   'left': '', 'right': ''
"            \}
"let g:lightline.separator = {
"            \   'left': '', 'right': ''
"            \}
function! Showtime()
    return strftime("%m/%d|%H:%M|%A|🚀😃")
endfunction
function! ShowLine()
    return line('$')
endfunction
function! GitInfo()
    let l:head = get(g:, 'coc_git_status', '')
    let l:head = l:head != '' ? printf(' %s ', l:head) : ''
    let l:status = get(b:, 'coc_git_status', '')
    let l:status = l:status != '' ? printf('%s ', trim(l:status)) : ''
    return l:head . l:status
endfunction

"---------------------------------------------------------------"
"               Color
"---------------------------------------------------------------"
set termguicolors
let g:sonokai_style                     = 'andromeda'
let g:sonokai_enable_italic             = 1
let g:sonokai_disable_italic_comment    = 1
let g:sonokai_cursor                    = 'auto'
let g:sonokai_menu_selection_background = 'blue'
let g:sonokai_transparent_background    = 1
let g:sonokai_diagnostic_text_highlight = 1
colorscheme sonokai

"---------------------------------------------------------------"
"               rainbow
"---------------------------------------------------------------"
let g:rainbow_active = 1
if expand("%:e") =~? '^\%(c\|cpp\|rs\)$'
    let g:rainbow_conf = {
                \   'guifgs': ['red','lightblue','lightcyan','lightgreen','darkgray','darkgreen','darkcyan','brown','gray','darkgreen','darkcyan'],
                \   'ctermfgs': ['red','lightblue','lightcyan','lightgreen','darkgray','darkgreen','darkcyan','brown','gray','darkgreen','darkcyan'],
                \   'operators': '_,\|+\|-\|*_',
                \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
                \}
else
    let g:rainbow_conf = {
                \   'guifgs': ['red','lightblue','lightcyan','lightgreen','darkgray','darkgreen','darkcyan','brown','gray','darkgreen','darkcyan'],
                \   'ctermfgs': ['red','lightblue','lightcyan','lightgreen','darkgray','darkgreen','darkcyan','brown','gray','darkgreen','darkcyan'],
                \   'operators': '_,\|+\|-\|*\|\*\*\|\/\|==_',
                \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
                \}
endif

"---------------------------------------------------------------"
"               leaderF
"---------------------------------------------------------------"
nnoremap <leader>t :LeaderfBufTag<CR>
nnoremap <leader>l :LeaderfLine<CR>
let g:Lf_WindowPosition = 'popup'
""let g:Lf_DefaultMode='Regex'

"---------------------------------------------------------------"
"               floaterm
"---------------------------------------------------------------"
let g:floaterm_title='TERM'
let g:floaterm_wintype = 'floating'
hi Floaterm guibg=#555555
hi FloatermBorder guibg=#555555 guifg=#2AC1A8
hi FloatermNC guibg=#2AC1A8
let g:floaterm_borderchars = ['','','','','','','','']
nnoremap <M-t> :FloatermNew bash<CR>
tnoremap <M-e>  <c-\><c-n>:FloatermHide<cr>
nnoremap <M-e>  :FloatermShow<cr>

"---------------------------------------------------------------"
"               markdown preview nvim
"---------------------------------------------------------------"
let g:mkdp_browser = 'chrome'
""let g:mkdp_browser = 'firefox'
let g:mkdp_page_title = '${name}'

"---------------------------------------------------------------"
"               neomake
"---------------------------------------------------------------"
call neomake#configure#automake('w')
let g:neomake_open_list = 1
let g:neomake_error_sign = {
            \ 'text': '❌',
            \ 'texthl': 'NeomakeErrorSign',
            \ }
let g:neomake_warning_sign = {
            \   'text': '🔔',
            \   'texthl': 'NeomakeWarningSign',
            \ }
let g:neomake_message_sign = {
            \   'text': '❔',
            \   'texthl': 'NeomakeMessageSign',
            \ }
let g:neomake_info_sign = {
            \ 'text': 'I',
            \ 'texthl': 'NeomakeInfoSign'
            \ }

"---------------------------------------------------------------"
"               coc.nvim
"---------------------------------------------------------------"
let g:coc_global_extensions=['coc-vimlsp','coc-json','coc-snippets',
            \ 'coc-python','coc-translator','coc-git','coc-calc',
            \ 'coc-highlight','coc-tabnine']
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
let g:coc_borderchars=['','','','','','','','']
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'vert h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
nmap <leader>r <Plug>(coc-rename)
nmap <leader>m :CocCommand document.renameCurrentWord<CR>
nmap <leader>c <Plug>(coc-cursors-word)
nmap <leader>s <Plug>(coc-translator-p)
vmap <leader>s <Plug>(coc-translator-pv)
nmap <silent> <leader>p <Plug>(coc-git-prevchunk)
nmap <silent> <leader>n <Plug>(coc-git-nextchunk)
xmap <silent> <leader>i <Plug>(coc-git-chunk-inner)
xmap <silent> <leader>o <Plug>(coc-git-chunk-outer)
nmap <leader>ca <plug>(coc-calc-result-append)
nmap <leader>cr <plug>(coc-calc-result-replace)
nmap <M-f> :CocSearch <C-r><C-w><CR>
let g:coc_status_error_sign='❌'
let g:coc_status_warning_sign='❗'


"---------------------------------------------------------------"
"               wildfire
"---------------------------------------------------------------"
vmap <silent>v <Plug>(expand_region_expand)
vmap <silent>V <Plug>(expand_region_shrink)


"---------------------------------------------------------------"
"               indentLine
"---------------------------------------------------------------"
let g:indentLine_char_list = ['|']
let g:indentLine_fileTypeExclude=['markdown','latex']
let g:indentLine_setColors=1
let g:indentLine_color_gui = 'lightgreen'
let g:indentLine_color_term='lightgreen'


"---------------------------------------------------------------"
"               vim-visual-multi
"---------------------------------------------------------------"
let g:VM_theme                      = 'ocean'
let g:VM_highlight_matches          = 'underline'
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-f>'
let g:VM_maps['Find Subword Under'] = '<C-f>'
let g:VM_maps['Select All']         = '<M-A>' 
let g:VM_maps['Select l']           = '<M-L>' 
let g:VM_maps['Select h']           = '<M-J>' 
let g:VM_maps['Add Cursor Down']    = '<M-K>'
let g:VM_maps['Add Cursor Up']      = '<M-I>'
let g:VM_maps['Add Cursor At Pos']  = '<C-p>'
let g:VM_maps['Add Cursor At Word'] = '<C-q>'
let g:VM_maps['Move Left']          = '<C-S-Left>'
let g:VM_maps['Move Right']         = '<C-S-Right>'
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Increase']           = '+'
let g:VM_maps['Decrease']           = '_'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'

"---------------------------------------------------------------"
"               vim-easytags
"---------------------------------------------------------------"
let g:easytags_cmd = '/usr/bin/ctags'

"---------------------------------------------------------------"
"               vim-current-word
"---------------------------------------------------------------"
hi CurrentWord guibg=#666666
hi MatchParen guibg=#d7a909 gui=bold,underline 
hi LineNr guifg=#2AC1A8
hi CursorLineNr guifg=#EE7777 gui=bold
hi VertSplit guibg=#2AC1A8 guifg=#2AC1A8
hi Visual gui=reverse

"---------------------------------------------------------------"
"               vim-markdown
"---------------------------------------------------------------"
let g:markdown_fenced_languages = ['c', 'python', 'fortran','lua','bash=sh']

"---------------------------------------------------------------"
"               forsub.vim
"---------------------------------------------------------------"
imap <M-p> <ESC>:ProcedureConvert<cr>zR^%O
