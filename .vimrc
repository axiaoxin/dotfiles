""""""""""""""""""""""VUNDLE PLUGIN""""""""""""""""""""

" 不兼容vi
set nocompatible

" 不检测文件类型
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'fisadev/vim-isort'

call vundle#end()

" 针对不同的文件类型采用不同的缩进格式
filetype plugin indent on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


""""""""""""""""""""""BASE CONFIG"""""""""""""""""""""""

" 取消备份
set nobackup
set noswapfile

" 解决中文乱码
set encoding=utf-8
set fileencodings=utf-8,chinese,gbk,latin-1,gb2312,ucs-bom,cp936
if has("win32")
  set fileencoding=chinese
else
  set fileencoding=utf-8
endif

" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" 解决consle输出乱码
language messages zh_CN.utf-8

" 状态栏配置
set laststatus=2

" 打开语法高亮
syntax enable

" 开启语法检测
syntax on

" vimrc文件修改之后自动加载
autocmd! bufwritepost .vimrc source %

" 文件修改之后自动载入
set autoread

" yy直接复制到系统剪切板（For macvim）
"set clipboard=unnamed

" 高亮搜索命中的文本
set hlsearch

" 随着键入即时搜索
set incsearch

" 搜索时忽略大小写
set ignorecase

" 有一个或以上大写字母时仍大小写敏感
set smartcase

set guifont=Menlo:h14
set lines=24 columns=80

" 设置配色
colorscheme elflord
set background=dark

" 在状态栏显示正在输入的命令
set showcmd

" 显示括号配对情况
set showmatch

" :next, :make 命令之前自动保存
set autowrite

" 允许使用鼠标
set mouse=a

" 设置行号
set nu

" 退格键可用
set backspace=2

" 退格键一次删掉4个空格
set smarttab

" 缩进
set autoindent
set smartindent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,cla

" 保存文件时自动删除行尾空格或Tab
autocmd BufWritePre * :%s/\s\+$//e

" 保存文件时自动删除末尾空行
autocmd BufWritePre * :%s/^$\n\+\%$//ge

" 填充Tab
set expandtab
set tabstop=4
set shiftwidth=4
set shiftround

" 代码折叠 光标在缩进下方时用za命令折叠或展开
set fdm=indent
" 默认展开
set foldlevel=99

" 突出显示当前行，列
"set cursorline
"set cursorcolumn

" 设置 退出vim后，内容显示在终端屏幕, 可以用于查看和复制
set t_ti= t_te=

" 打开文件时始终跳转到上次光标所在位置
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif


"""""""""""""""""""""""""KEY MAPPING""""""""""""""""""""

" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

" normal模式下Ctrl+c全选并复杂到系统剪贴板，必须装有vim-gnome
nmap <C-c> gg"+yG

" visual模式下Ctrl+c复制选中内容到剪贴板
vmap <C-c> "+y

" insert下CTRL-v原样粘贴剪切板内容
imap <C-v> <Esc>"+p

" w!!写入只读文件
cmap w!! w !sudo tee >/dev/null %

" F2切换行号显示
nnoremap <F2> :set nonu!<CR>:set foldcolumn=0<CR>

" F3打开目录树
nmap <silent> <F3> :NERDTreeToggle<CR>

" F4显示TagList
nmap <silent> <F4> :TlistToggle<CR>

" F5运行脚本
autocmd BufRead,BufNewFile *.py nmap <F5> :!python %<CR>

" F6编译脚本
autocmd BufRead,BufNewFile *.py set makeprg=python\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
autocmd BufRead,BufNewFile *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
autocmd BufRead,BufNewFile *.py nmap <F6> :make<CR>

" <F7> 新建标签页
map <F7> <Esc>:tabnew<CR>

" <F8> auto file pep8
autocmd BufRead,BufNewFile *.py nmap <F8> :!autopep8 -i -a --ignore=W690,E501 %<CR>

" <F9> auto all pep8
nmap <F9> :!find . -type f -name "*.py" \| xargs autopep8 -i -a --ignore=W690,E501<CR>

" 给当前单词添加引号
nnoremap w" viw<esc>a"<esc>hbi"<esc>lel
nnoremap w' viw<esc>a'<esc>hbi'<esc>lel

" 在Normal Mode和Visual/Select Mode下，利用Tab键和Shift-Tab键来缩进文本
nmap <tab> V>
nmap <s-tab> V<
vmap <tab> >gv
vmap <s-tab> <gv

" 左右分割窗口Ctrl+w +v
" 上下分割窗口Ctrl+w +s
" 关闭窗口Ctrl+w  +q

" quicker window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


""""""""""""""""""""""""""""""PLUGIN CONFIG""""""""""""""""""""""""""

" NERDTREE
" 不显示的文件
let NERDTreeIgnore=['\.pyc$', '\~$']
" show nerdtree when starts up
"autocmd vimenter * NERDTree
" 退出最后一个buff时也退出nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint', 'flake8']

" vim-isort
let g:vim_isort_map = '<C-i>'
