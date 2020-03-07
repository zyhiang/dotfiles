let mapleader = ','

" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

let g:python3_host_prog = '/usr/local/bin/python3'

call plug#begin('~/.config/nvim/plugged')
Plug 'zyhiang/onedark.vim' " 主题
Plug 'tpope/vim-commentary' " 注释
Plug 'ybian/smartim' " 中文输入法
Plug 'mhinz/vim-startify' " 启动页
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kristijanhusak/defx-git'
Plug 'kristijanhusak/defx-icons'
Plug 'itchyny/lightline.vim'
Plug 'jpalardy/vim-slime' "发射代码到ipython
Plug 'airblade/vim-gitgutter' " git
Plug 'tpope/vim-fugitive' " git
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree' " 撤消历史可视化
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'josa42/vim-lightline-coc'
Plug 'iamcco/markdown-preview.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'fisadev/vim-isort'
Plug 'ntpeters/vim-better-whitespace' " 显示空白符
Plug 'hiberabyss/vim-rest-console' " fork by diepm/vim-res-console
Plug 'skywind3000/quickmenu.vim' " 自定义菜单
Plug 'buoto/gotests-vim' " 根据函数内容生成gotest实例
Plug 'chemzqm/wxapp.vim' " 微信小程序扩展

" Plug 'nathanaelkane/vim-indent-guides' " 缩进线
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python 高亮
" Plug 'Raimondi/delimitMate' " 双括号
call plug#end()


" =================config=================

colorscheme onedark

" 允许在有未保存的修改时切换缓冲区
set hidden
" 英文单词在换行时不被截断
set linebreak
" 右下角显示光标位置的状态行
set ruler
" 显示行号
set number
" 相对行号显示
set relativenumber
" 突出显示当前行
set cursorline
" 开启状态栏信息
set laststatus=2
" 高亮显示搜索结果
set hlsearch
"打开断行模块对亚洲语言支持
set fo+=mB
" 不在单词中间断行
set lbr
" 延迟绘制（提升性能）
set lazyredraw
" 更新时间
set updatetime=300
" 不显示 模式
set noshowmode
" 保持在光标上下最少行数
set  scrolloff=5
" 背景色为黑色
set background=dark
" 设置真彩
if has("termguicolors")
    set termguicolors
endif
" 文件检测
filetype on
" Enable filetype plugins
filetype plugin on
" 自适应不同语言的智能缩进
filetype indent on
" 开启语法高亮功能
syntax on
" 关闭自动备份
set nobackup
set nowritebackup
set noswapfile " 禁止创建交换文件
" 缩进折叠
set foldmethod=indent
set foldlevel=99
" 编码utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1
" 根据文件类型设置tab
autocmd FileType python,shell,bash,vim,go,markdown set et sw=4 ts=4 sts=4
autocmd FileType javascript,html,css,xml,yaml,rest set et sw=2 ts=2 sts=2

" py文件保存的时候自动执行
" au BufWrite *.py :Autoformat
" au BufWrite *.py :Isort
"===========================map=============================

" 缩进空格折叠
noremap <space> za
""se swap之后，同物理行上线直接跳
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j
" Go to home and end using capitalized directions
noremap H ^
noremap L $
" 块选一直tab
vmap < <gv
vmap > >gv
" 关闭方向键, 强迫hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" noremap J 3j
" noremap K 3k
" 复制到剪贴板
noremap Y "*y

nnoremap <Leader>l :LeaderfBuffer<Cr>
nnoremap <Leader>f :LeaderfFile<Cr>
nnoremap <Leader>u :UndotreeToggle<Cr>
nnoremap <Leader>t :TagbarToggle<Cr>
nnoremap <Leader>e :Defx<Cr>
nnoremap <Leader>s :w<Cr>

" ------------------------------------------lightline-----------------------------------------------
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ }

let g:lightline.component_expand = {
    \   'linter_warnings': 'lightline#coc#warnings',
    \   'linter_errors': 'lightline#coc#errors',
    \   'linter_ok': 'lightline#coc#ok',
    \   'status': 'lightline#coc#status',
    \   'gitbranch': 'fugitive#head',
    \ }

" Set color to the components:
let g:lightline.component_type = {
    \   'linter_warnings': 'warning',
    \   'linter_errors': 'error',
    \ }

let g:lightline.active = {
    \ 'left': [
    \   [ 'mode', 'paste' ],
    \   [ 'readonly', 'filename', 'modified', 'gitbranch'],
    \   ['coc_errors', 'coc_warnings'],
    \  ],
    \ }

call lightline#coc#register()

"-------------------------------------------------------end------------------------------------------------


"-----------vim-go-------------------
let g:go_highlight_functions = 1
let g:go_highlight_fields = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1

let g:go_fmt_command = "goimports"
"------------end-----------------------

" --------------------------gitgutter-------------------
 " ▍ ▎ ▏
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'


highlight GitGutterAdd    guifg=#587C0C
highlight GitGutterChange guifg=#0C7D9D
highlight GitGutterDelete guifg=#94151B
highlight GitGutterChangeDelete guifg=#94151B

" ----------------------------end------------------------

" -----------------------coc-----------------------------
" 让错误文本显示为红色
" highlight CocErrorHighlight ctermfg=Red  guifg=#b91a22
" don't give |ins-completion-menu| messages.
highlight CocErrorSign guifg=#B96B70

set shortmess+=c

" always show signcolumns
set signcolumn=yes


call coc#add_extension('coc-json', 'coc-syntax', 'coc-snippets', 'coc-python', 'coc-pairs', 'coc-highlight')

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


"-------smartim--------------
let g:smartim_default = 'com.apple.keylayout.ABC'
" 使用CTRL-C而不是ESC时不会发生Vim InsertLeave事件
ino <C-C> <Esc>

" -----------------------vim-slime-----------------------------
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "{right-of}"}
let g:slime_python_ipython = 1

"------------------------------defx---------------------------------
call defx#custom#option('_',{
      \ 'columns': 'indent:git:icons:filename',
      \ 'split'     : 'vertical',
      \ 'direction' : 'topleft',
      \ 'winwidth'  : 35,
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 1,
      \ 'resume': 1,
      \ })

let g:defx_icons_enable_syntax_highlight = 1
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  setl nonumber
  setl norelativenumber
  setl listchars=
  " Define mappings
  nnoremap <silent><buffer><expr> <CR>
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> l
    \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
    nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> v
  \ defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> s
  \ defx#do_action('drop', 'pedit')
 " nnoremap <silent><buffer><expr> l
  " \ defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
    nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h
  \ defx#is_opened_tree() ? defx#do_action('close_tree') :defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  noremap <silent><buffer><expr> R defx#do_action('redraw')
  " nnoremap <silent><buffer><expr> M
  " \ defx#do_action('new_multiple_files')
  " nnoremap <silent><buffer><expr> C
  " \ defx#do_action('toggle_columns',
  " \                'mark:filename:type:size:time')
  " nnoremap <silent><buffer><expr> !
  " \ defx#do_action('execute_command')
  " nnoremap <silent><buffer><expr> x
  " \ defx#do_action('execute_system')
  " nnoremap <silent><buffer><expr> yy
  " \ defx#do_action('yank_path')
  " nnoremap <silent><buffer><expr> ;
  " \ defx#do_action('repeat')
  " nnoremap <silent><buffer><expr> ~
  " \ defx#do_action('cd')
  " nnoremap <silent><buffer><expr> *
  " \ defx#do_action('toggle_select_all')
  " nnoremap <silent><buffer><expr> j
  " \ line('.') == line('$') ? 'gg' : 'j'
  " nnoremap <silent><buffer><expr> k
  " \ line('.') == 1 ? 'G' : 'k'
  " nnoremap <silent><buffer><expr> <C-l>
  " \ defx#do_action('redraw')
  " nnoremap <silent><buffer><expr> <C-g>
  " \ defx#do_action('print')
  " nnoremap <silent><buffer><expr> cd
  " \ defx#do_action('change_vim_cwd')
endfunction

"--------------------markdown------------------------------------------------
let g:mkdp_auto_start = 0 " 自动打开浏览器
" let g:mkdp_auto_close = 0
" let g:mkdp_auto_open = 1


"----------------------------vim-sort----------------------------------------

let g:vim_isort_config_overrides = {
  \ 'include_trailing_comma': 1, 'multi_line_output': 3}


"------------------------------autoformat--------------------------------------
" let g:autoformat_verbosemode=1 "debug
let g:formatters_python = ['black']

" ---------------------------------leaderf-------------------------------------
"
" let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_PreviewResult = {'Rg': 1 }

" 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')

let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': ''}

" 显示绝对路径
let g:Lf_ShowRelativePath = 0

" 隐藏帮助
let g:Lf_HideHelp = 1

" 模糊匹配忽略扩展名
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
            \ }

" MRU 文件忽略扩展名
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']
let g:Lf_StlColorscheme = 'powerline'

" 根据文件类型禁用插件
let g:better_whitespace_filetypes_blacklist=['startify']

let g:Lf_StlPalette = {
            \   'stlName': {
            \       'gui': 'bold',
            \       'font': 'NONE',
            \       'guifg': '#282c34',
            \       'guibg': '#98c379',
            \       'cterm': 'bold',
            \       'ctermfg': '22',
            \       'ctermbg': '157'
            \   },
            \   'stlCategory': {
			\       'gui': 'bold',
            \       'font': 'NONE',
            \       'guifg': '#282c34',
            \       'guibg': '#e06c75',
            \       'cterm': 'NONE',
            \       'ctermfg': '16',
            \       'ctermbg': '210'
            \   },
            \   'stlNameOnlyMode': {
            \       'gui': 'NONE',
            \       'font': 'NONE',
            \       'guifg': '#282c34',
            \       'guibg': '#e5c07b',
            \       'cterm': 'NONE',
            \       'ctermfg': '16',
            \       'ctermbg': '227'
            \   },
            \   'stlFullPathMode': {
			\       'gui': 'bold',
            \       'font': 'NONE',
            \       'guifg': '#282c34',
            \       'guibg': '#c678dd',
            \       'cterm': 'NONE',
            \       'ctermfg': '16',
            \       'ctermbg': '147'
            \   },
            \   'stlFuzzyMode': {
            \       'gui': 'NONE',
            \       'font': 'NONE',
            \       'guifg': '#282c34',
            \       'guibg': '#e5c07b',
            \       'cterm': 'NONE',
            \       'ctermfg': '16',
            \       'ctermbg': '227'
            \   },
            \   'stlRegexMode': {
            \       'gui': 'NONE',
            \       'font': 'NONE',
            \       'guifg': '#282c34',
            \       'guibg': '#56b6c2',
            \       'cterm': 'NONE',
            \       'ctermfg': '16',
            \       'ctermbg': '121'
            \   },
            \   'stlCwd': {
            \       'gui': 'NONE',
            \       'font': 'NONE',
            \       'guifg': '#EBFFEF',
            \       'guibg': '#282c34',
            \       'cterm': 'NONE',
            \       'ctermfg': '195',
            \       'ctermbg': '241'
            \   },
            \   'stlBlank': {
            \       'gui': 'NONE',
            \       'font': 'NONE',
            \       'guifg': '#98c379',
            \       'guibg': '#282c34',
            \       'cterm': 'NONE',
            \       'ctermfg': 'NONE',
            \       'ctermbg': '237'
            \   },
            \   'stlLineInfo': {
            \       'gui': 'NONE',
            \       'font': 'NONE',
            \       'guifg': '#abb2bf',
            \       'guibg': '#3e4452',
            \       'cterm': 'NONE',
            \       'ctermfg': '16',
            \       'ctermbg': '195'
            \   },
            \   'stlTotal': {
            \       'gui': 'NONE',
            \       'font': 'NONE',
            \       'guifg': '#282c34',
            \       'guibg': '#98c379',
            \       'cterm': 'NONE',
            \       'ctermfg': '16',
            \       'ctermbg': '149'
            \   }
            \ }


"----------------------------------startify----------------------------------

" 设置书签
let g:startify_bookmarks            = [
            \ '~/.config/nvim/init.vim',
            \ '~/Documents/bctop/media',
            \ '~/Documents/code/gopath/src/apiserver',
            \]

let g:startify_custom_header = [
			\ '                      ___           ___           ___                                      ___     ',
			\ '                     /  /\         /  /\         /  /\          ___            ___        /  /\    ',
			\ '                    /  /::\       /  /::|       /  /::\        /  /\          /__/\      /  /::|   ',
			\ '                   /  /:/\:\     /  /:|:|      /  /:/\:\      /  /:/          \__\:\    /  /:|:|   ',
			\ '                  /  /:/  \:\   /  /:/|:|__   /  /::\ \:\    /  /:/           /  /::\  /  /:/|:|__ ',
			\ '                 /__/:/ \__\:\ /__/:/ |:| /\ /__/:/\:\ \:\  /__/:/  ___    __/  /:/\/ /__/:/_|::::\',
			\ '                 \  \:\ /  /:/ \__\/  |:|/:/ \  \:\ \:\_\/  |  |:| /  /\  /__/\/:/~~  \__\/  /~~/:/',
			\ '                  \  \:\  /:/      |  |:/:/   \  \:\ \:\    |  |:|/  /:/  \  \::/           /  /:/ ',
			\ '                   \  \:\/:/       |__|::/     \  \:\_\/    |__|:|__/:/    \  \:\          /  /:/  ',
			\ '                    \  \::/        /__/:/       \  \:\       \  \::::/      \__\/         /__/:/   ',
			\ '                     \__\/         \__\/         \__\/        \__\__/                     \__\/    ',
			\]



" ------------------------------------------vim-rest-client-----------------------------------------------

let g:vrc_trigger = '<Tab>' " 快捷键映射"
" let g:vrc_response_default_content_type = 'application/json'
" let b:vrc_response_default_content_type = 'application/json'
let g:vrc_auto_format_uhex = 1 " 中文编码
let g:vrc_horizontal_split = 1
" let s:vrc_auto_format_response_patterns = {
"       \ 'json': 'jq',
"       \ 'xml': 'xmllint --format -',
" \}
" let g:vrc_show_command = 1
" let b:vrc_header_content_type = 'application/json; charset=utf-8'
" let g:vrc_debug=1


" ------------------------------------------quickmenu-----------------------------------------------
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LHT"

" clear all the items
call g:quickmenu#reset()

" bind to F12
noremap <Leader>m :call quickmenu#toggle(0)<cr>


" section 1, text starting with "#" represents a section (see the screen capture below)
call g:quickmenu#append('# Leaderf', '')
call g:quickmenu#append('ag', 'Leaderf rg', 'leaderf rg {word}')
call g:quickmenu#append('recall', 'Leaderf --recall', 'leaderf recall')

" new section
call quickmenu#append("# Git", '')

" use fugitive to show diff
call quickmenu#append("git diff", 'Gvdiff', "use fugitive's Gvdiff on current document")




