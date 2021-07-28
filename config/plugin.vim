""let g:plug_url_format="https://git@::hub.fastgit.org/%s.git"
""let g:plug_url_format='https://git::@hub.fastgit.org/%s.git'

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
Plug 'xolox/vim-easytags'
call plug#end()
let g:plug_threads=8
"""-----------------plug-----------------"
"""+--------------------lightline--------------------+"
set laststatus=2
let g:lightline = {
            \ 'colorscheme' : 'sonokai',
            \ 'active'      : {
            \ 'left'        : [ [ 'mode', 'paste'],
            \               [ 'readonly', 'filename', 'modified'],
            \               ['time'] ],
            \   'right': [ [ 'lineinfo' ],
            \              [ 'percent' ],
            \              [ 'git','fileformat', 'fileencoding', 'filetype' ] ]
            \ },
            \ 'component_function': {
            \   'time':'Showtime',
            \   'git':'GitInfo'
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
function! GitInfo()
    let l:head = get(g:, 'coc_git_status', '')
    let l:head = l:head != '' ? printf(' %s ', l:head) : ''
    let l:status = get(b:, 'coc_git_status', '')
    let l:status = l:status != '' ? printf('%s ', trim(l:status)) : ''
    return l:head . l:status
endfunction
""function! MyFiletype()
""    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
""endfunction
""function! MyFileformat()
""    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
""endfunction
"""+--------------------lightline--------------------+"
"""+--------------------indentLine--------------------+"
let g:indentLine_char_list = ['¦']

let g:tex_conceal=''
set conceallevel=0
set concealcursor=inc
""let g:indentLine_color_term='lightblue'
""let g:indentLine_color_gui = '#A4E57E'
""let g:indentLine_color_gui = 'lightblue'
""let g:indentLine_bgcolor_gui = 'lightblue'
""let g:indentLine_bgcolor_gui ="#9bb78f"
""'#FF5F00'
"""+--------------------indentLine--------------------+"
"""+--------------------Color--------------------+"
if has('termguicolors')
    set termguicolors
endif
" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style                     = 'andromeda'
let g:sonokai_enable_italic             = 1
let g:sonokai_disable_italic_comment    = 1
let g:sonokai_cursor                    = 'purple'
let g:sonokai_menu_selection_background = 'blue'
let g:sonokai_transparent_background    = 1
""let g:dracula_bold = 1
""let g:dracula_italic = 1
""let g:dracula_underline = 1
""let g:dracula_undercurl = 1
""let g:dracula_inverse = 1
""let g:dracula_colorterm = 0

colorscheme sonokai

"""+--------------------Color--------------------+"
"""+--------------------rainbow--------------------+"
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['red','lightblue','lightmagenta','lightgreen','darkgray','darkgreen','darkcyan','darkred','brown','gray','darkgreen','darkcyan','darkred'],
            \   'ctermfgs': ['red','lightblue','lightmagenta','lightgreen','darkgray','darkgreen','darkcyan','darkred','brown','gray','darkgreen','darkcyan','darkred'],
            \   'operators': '_,\|+\|-\|*\|\*\*\|\/\|==_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \}
"""+--------------------rainbow--------------------+"
"""""+--------------------browser_search--------------------+"
""let g:browser_search_default_engine="bing"
""nmap <silent> <Leader>s <Plug>SearchNormal<CR>
""vmap <silent> <Leader>s <Plug>SearchVisual<CR>
"""""+--------------------browser_search--------------------+"
"""+--------------------tagbar--------------------+"
nnoremap <leader>t :LeaderfBufTag<CR>
nnoremap <leader>l :LeaderfLine<CR>
let g:Lf_WindowPosition = 'popup'
""let g:Lf_DefaultMode='Regex'

""let g:tagbar_show_linenumbers = 2
"""+--------------------tagbar--------------------+"
"""+--------------------floaterm--------------------+"
let g:floaterm_title='TERM'
""let g:floaterm_height    = 0.8
""let g:floaterm_width     = 0.4
""let g:floaterm_position  = 'right'
""let g:floaterm_wintype   = 'popup'
let g:floaterm_wintype = 'floating'
hi Floaterm guibg=#555555
hi FloatermBorder guibg=#555555 guifg=#2AC1A8
""hi FloatermBorder guibg=#9bb78f    guifg=#000000
"" #2AC1A8
hi FloatermNC guibg=#2AC1A8
""let g:floaterm_borderchars = ['-','|','-','|','+','+','+','+']
let g:floaterm_borderchars = ['','','','','','','','']
nnoremap <M-t> :FloatermNew bash<CR>
tnoremap <M-e>  <c-\><c-n>:FloatermHide<cr>
nnoremap <M-e>  :FloatermShow<cr>

""tnoremap <silent><expr> <M-t>  &ft == "floaterm" ? "<c-\><c-n>:FloatermToggle bash<cr>" : "<c-t>"
"+--------------------floaterm--------------------+"
"+--------------------markdown-preview--------------------+"
""let g:mkdp_browser = 'chrome'
let g:mkdp_browser = 'firefox'
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
"+--------------------markdown-preview--------------------+"
"+--------------------complete----------------------------+"
""imap <Tab>   <Plug>EasyCompTabTrigger
""imap <S-Tab> <Plug>EasyCompShiftTabTrigger
"+--------------------complete----------------------------+"
"+--------------------neomake----------------------------+"
call neomake#configure#automake('w')
let g:neomake_open_list = 1
""let g:neomake_logfile = '~/log/neomake.log'
let g:neomake_error_sign = {
            \ 'text': '❌',
            \ 'texthl': 'NeomakeErrorSign',
            \ }
let g:neomake_warning_sign = {
            \   'text': '⚡',
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
"+--------------------neomake----------------------------+"
"+--------------------tabnine-----------------------"
"+--------------------coc-------------------------+"
let g:coc_global_extensions=['coc-vimlsp','coc-json','coc-snippets','coc-python','coc-translator','coc-git','coc-calc']
""set signcolumn=yes
""inoremap <silent><expr> <M-r> coc#refresh()
inoremap <expr> <CR> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
""
inoremap <silent><expr> <TAB>
            \ pumvisible() ? coc#_select_confirm() :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
""\ coc#expandableOrJumpable() ?
"\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'
let g:coc_borderchars=['','','','','','','','']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
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
"-----------------------coc-git-------------------------------------"
nmap <silent> <leader>p <Plug>(coc-git-prevchunk)
nmap <silent> <leader>n <Plug>(coc-git-nextchunk)
xmap <silent> <leader>i <Plug>(coc-git-chunk-inner)
xmap <silent> <leader>o <Plug>(coc-git-chunk-outer)

nmap <leader>ca <plug>(coc-calc-result-append)
nmap <leader>cr <plug>(coc-calc-result-replace)
nmap F <Plug>(coc-format-selected)
nmap <M-f> :CocSearch <C-r><C-w><CR>
let g:coc_status_error_sign='❌'
let g:coc_status_warning_sign='❗'


" Use <c-space> to trigger completion.
"+--------------------coc-------------------------+"
"+--------------------wildfire--------------------+"
vmap <silent>v <Plug>(expand_region_expand)
vmap <silent>V <Plug>(expand_region_shrink)
"+----------------------vim-visual-multi-----------"
let g:VM_theme                      = 'ocean'
let g:VM_highlight_matches          = 'underline'
let g:VM_maps                       = {}
let g:VM_maps['Find Under']         = '<C-f>'
let g:VM_maps['Find Subword Under'] = '<C-f>'
let g:VM_maps['Select All']         = '<leader>a' 
let g:VM_maps['Select l']           = '<leader><Right>' 
let g:VM_maps['Select h']           = '<leader><Left>' 
let g:VM_maps['Add Cursor Down']    = '<leader><Down>'
let g:VM_maps['Add Cursor Up']      = '<leader><Up>'
let g:VM_maps['Add Cursor At Pos']  = '<C-p>'
let g:VM_maps['Add Cursor At Word'] = '<C-w>'
let g:VM_maps['Move Left']          = '<C-S-Left>'
let g:VM_maps['Move Right']         = '<C-S-Right>'
let g:VM_maps['Remove Region']      = 'q'
let g:VM_maps['Increase']           = '+'
let g:VM_maps['Decrease']           = '_'
let g:VM_maps["Undo"]               = 'u'
let g:VM_maps["Redo"]               = '<C-r>'
"-----------------easytags--------------"
let g:easytags_cmd = '/usr/bin/ctags'
"-------------current word----------"
hi CurrentWord guibg=#5c738a gui=underline,bold,italic
hi CurrentWordTwins guibg=#5c738a  gui=underline,bold,italic

