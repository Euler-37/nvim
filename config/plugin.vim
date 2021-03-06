""let g:plug_url_format="https://git@::hub.fastgit.org/%s.git"

call plug#begin('~/.vim/plugged')
Plug 'sainnhe/sonokai'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'luochen1990/rainbow'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'itchyny/vim-cursorword'
Plug 'voldikss/vim-floaterm'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'neomake/neomake'
Plug 'neoclide/coc.nvim',{'branch': 'release'}
Plug 'gcmt/wildfire.vim'
Plug '~/.vim/plugged/markdown-preview.nvim', { 'do': { -> mkdp#util#install() },'for': ['markdown', 'plug']}
call plug#end()
let g:plug_threads=8
"""-----------------plug-----------------"
"""+--------------------lightline--------------------+"
set laststatus=2
let g:lightline = {
            \ 'colorscheme' : 'sonokai',
            \ 'active'      : {
            \ 'left'        : [ [ 'mode', 'paste' ],
            \             [ 'readonly', 'filename', 'modified', 'time' ] ]
            \ },
            \ 'component_function': {
            \   'time':'Showtime'
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
""function! MyFiletype()
""    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
""endfunction
""function! MyFileformat()
""    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
""endfunction
"""+--------------------lightline--------------------+"
"""+--------------------indentLine--------------------+"
let g:indentLine_char_list = ['|']
let g:tex_conceal=''
set conceallevel=0
set concealcursor=inc
""""let g:indentLine_color_gui = 'blue'
""""let g:indentLine_bgcolor_gui = 'lightblue'
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
nmap <leader>t :TagbarToggle<CR>
let g:tagbar_show_linenumbers = 2
"""+--------------------tagbar--------------------+"
"""+--------------------floaterm--------------------+"
let g:floaterm_title=''
let g:floaterm_height    = 0.8
let g:floaterm_width     = 0.4
let g:floaterm_position  = 'right'
""let g:floaterm_wintype   = 'popup'
let g:floaterm_wintype = 'floating'
""hi Floaterm guibg=black
""hi FloatermBorder ctermbg=red ctermfg=green
""hi FloatermNC guibg=skyblue
let g:floaterm_borderchars = ['-','|','-','|','+','+','+','+']
nmap <M-t> :FloatermNew sh<CR>
"+--------------------floaterm--------------------+"
"+--------------------markdown-preview--------------------+"
let g:mkdp_browser = 'chrome'
"+--------------------markdown-preview--------------------+"
"+--------------------complete----------------------------+"
imap <Tab>   <Plug>EasyCompTabTrigger
imap <S-Tab> <Plug>EasyCompShiftTabTrigger
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
            \   'text': '❗',
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
let g:coc_global_extensions=['coc-vimlsp','coc-json','coc-snippets','coc-tabnine','coc-python','coc-translator','coc-git','coc-calc']
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
""let g:coc_borderchars=['-','|','-','|','+','+','+','+']

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
nmap <leader>n <Plug>(coc-rename)
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
let g:coc_status_error_sign='❌'
let g:coc_status_warning_sign='❗'


" Use <c-space> to trigger completion.
"+--------------------coc-------------------------+"
"+--------------------wildfire--------------------+"
let g:wildfire_objects = {
            \ "*" : ["i'", 'i"', "i)", "i]", "i}","i>","ip","it"]
            \ }
