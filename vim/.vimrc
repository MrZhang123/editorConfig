" ---------------vim set-------------------
" 在vim中，按<Esc>和按<Ctrl-c>一样，都可以到Normal模式
" set vim to en

let $LANG = 'en_US'
set langmenu=en_US

" Mac下设置vim共享系统剪切板（所有删除和拷贝工作都默认到匿名寄存器）

set clipboard=unnamed

" set vim leader is ; default is \

let mapleader=";"

" 设置iterm2内vim滚动

set mouse=a

" 自动将当前目录设置为包含当前文件的目录，然后按下ctrl-x-f触发提示

set autochdir

" 显示行号

set number

" 关闭 vi 兼容模式

set nocompatible

" 突出显示当前行

set cursorline

" 突出显示当前列

set cursorcolumn

" 打开状态栏标尺

set ruler

" 设定 tab 长度

set tabstop=4

" 输入tab时自动将其转化为空格

set expandtab

" 设定 << 和 >> 命令移动时的宽度为 2

set shiftwidth=4

" 使得按退格键时可以一次删掉 2 个空格

set softtabstop=4

" 插入括号时，短暂地跳转到匹配的对应括号

set showmatch

" 开始折叠

set foldenable

" 设置语法折叠

set foldmethod=syntax

"打开文件是默认不折叠代码

set foldlevelstart=99

" 设定命令行的行数为 1

set cmdheight=1

" 显示状态栏 (默认值为 1, 无法显示状态栏)

set laststatus=2

" 设置相对行

" set relativenumber

" 括号匹配

" set matchpairs=(:),{:},[:]

" 设置搜索高亮，搜索完成取消键入“:noh”即可

set hlsearch

" 设置默认进行大小写不敏感查找

set ignorecase

" 如果有一个大写字母，则切换到大小写敏感查找

set smartcase

set fileformats=unix,dos,mac
set fenc=utf-8
set fencs=utf-8
set tenc=utf-8
if has("gui_running")
	" 隐藏左侧滚动条
	set guioptions-=L
	" 隐藏右侧滚动条
	set guioptions-=r
	" 隐藏底部滚动条
	set guioptions-=b
	" 设置字体
	set macligatures
	set guifont=Dank\ Mono:h18
  " set guifont=OperatorMono-Book:h18
  " set guifont=Fira\ Code:h18
	" 设置透明背景
	" set transparency=1
endif

" 根据不同的文件设置不同的tabsize等
if has("autocmd")
  " autocmd FileType html,css,javascript,jsx,javascript.jsx setlocal ts=2 sts=2 sw=2
endif
" ----------------plugin----------------------

call plug#begin('~/.vim/plugged')


Plug 'Valloric/YouCompleteMe'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'Raimondi/delimitMate'
Plug 'editorconfig/editorconfig-vim'
Plug 'pangloss/vim-javascript'
" Plug 'cakebaker/scss-syntax.vim'
" Plug 'prettier/vim-prettier'
" Plug 'Chiel92/vim-autoformat'
" Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'Yggdroot/indentLine'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" Plug 'tpope/vim-surround'
" Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" 设置theme

syntax on " 开启插件
syntax enable " 开启语法高亮
set background=dark
colorscheme solarized

" 设置CtrlP

set wildignore+=*/tmp/*,*.so,*.swp,*.zip " MacOSX/Linux

let g:ctrlp_custom_ignore = { 'dir': 'build$\|node_modules$' }

" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


" airline设置

set laststatus=2
let g:airline_theme="powerlineish"
"let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#buffer_nr_show = 1

" YouCompleteMe

let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_key_list_select_completion = ['<c-n>', '<c-j>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<c-k>']
let g:ycm_error_symbol = '💩'
let g:ycm_warning_symbol = '👻'
" 按Ctrl-z提示
" let g:ycm_key_invoke_completion = '<c-z>'
" 自动提示
let g:ycm_semantic_triggers =  {
  \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
  \ 'cs,lua,javascript': ['re!\w{2}'],
  \ }

" emmet-vim
" 设置需要使用emmet的文件
autocmd FileType html,css,jsx,javascript.jsx EmmetInstall
" 设置启动快捷键为tab
let g:user_emmet_expandabbr_key = '<Tab>'
let g:user_emmet_mode='a'
let g:user_emmet_settings = {'javascript.jsx': {'extends': 'jsx'}}
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" vim-jsx

let g:jsx_ext_required = 0

" scss-syntax

" au FileType scss set iskeyword+=-
" au BufRead,BufNewFile *.scss set filetype=scss.css

" indentLine
let g:indentLine_enabled = 1
let g:indentLine_char = '⎸'

" The NERDTree

" Ctrl n 打开关闭NERDTree

map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" NERDTreeIgnore
let NERDTreeIgnore = ['\.swp$', '.DS_Store']

" 显示点开头的文件

let NERDTreeShowHidden=1

" nerdcommenter

let g:NERDSpaceDelims=1
" suport react jsx
let g:NERDCustomDelimiters={
	\ 'javascript': { 'left': '//', 'right': '', 'leftAlt': '{/*', 'rightAlt': '*/}' },
\}

" vim-markdown
" use math extensions
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0

" vim-json
" 禁用vim-json隐藏双引号
set conceallevel=0
" let g:vim_json_syntax_conceal = 0

" ale for linter
" let g:ale_fixers = ['eslint', 'prettier']
" let g:ale_sign_error = '👊'
" let g:ale_sign_warning = '🎃'
" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'
" let g:ale_open_list = 1
" let g:ale_fix_on_save = 1

" vim-signify
" let g:signify_vcs_list = [ 'git', 'hg' ]

" ---------------vim快捷键设置-------------
" ---------------vim keyboard reset-------------
" 修改代码折叠，打开快捷键
" 代码折叠
nnoremap <S-n> zc
nnoremap <S-m> zo

" jump list (previous, next)
" 由于在vim中Tab和Ctrl-i是等价的，所以修改使用方式
nnoremap <C-l> <C-i>
nnoremap <C-h> <C-o>

" 设置移动当前行向上向下快捷键（终端下设置commond键或者Alt键有冲突，所以更改为shift键）
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
" 输入模式下由于与输入大写字母冲突，所以注释
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi

" 在Normal和Visual/Select Mode下，设置Tab键和shift-tab键缩进文本
nmap <tab> V>
nmap <S-tab> V<
vmap <tab> >gv
vmap <S-tab> <gv

" 设置操作buffer
nmap <leader>d :bd<CR> " close buffer
nnoremap <S-h> :bp<CR> " pre buffer
nnoremap <S-l> :bn<CR> " next buffer

" 设置保存快捷键
nmap <leader>w :w<CR>

" 修改进入normal模式的快捷键
" inoremap jj <Esc>
" vnoremap jj <Esc>

" 修改完配置重新加载.vimrc文件

nnoremap <leader>r :source ~/.vimrc<CR>

" YCM跳转到定义（只写了js的配置，回跳使用ctrl+o）
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR> " 跳转到申明
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>  " 跳转到定义
nnoremap <leader>g :YcmCompleter GoTo<CR>             " 这个命令试图执行它所能执行的“最合理的”转到操作
nnoremap <leader>tp :YcmCompleter GoToType<CR>        " 跳转到type

" ---------vim-prettier------------

" max line length that prettier will wrap on
" Prettier default: 80
" let g:prettier#config#print_width = 80

" number of spaces per indentation level
" Prettier default: 2
let g:prettier#config#tab_width = 4
let g:prettier#config#tab_size = 4

" use tabs over spaces
" Prettier default: false
let g:prettier#config#use_tabs = 'false'

" print semicolons
" Prettier default: true
let g:prettier#config#semi = 'true'

" single quotes over double quotes
" Prettier default: false
let g:prettier#config#single_quote = 'true'

" print spaces between brackets
" Prettier default: true
let g:prettier#config#bracket_spacing = 'false'

" put > on the last line instead of new line
" Prettier default: false
let g:prettier#config#jsx_bracket_same_line = 'false'

" avoid|always
" Prettier default: avoid
let g:prettier#config#arrow_parens = 'always'

" none|es5|all
" Prettier default: none
let g:prettier#config#trailing_comma = 'all'

" flow|babylon|typescript|css|less|scss|json|graphql|markdown
" Prettier default: babylon
" let g:prettier#config#parser = 'markdown'

" cli-override|file-override|prefer-file
let g:prettier#config#config_precedence = 'prefer-file'

" always|never|preserve
let g:prettier#config#prose_wrap = 'preserve'
