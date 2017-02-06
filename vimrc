"加上这句解决:PluginInstall安装插件时出现Unknown function: vundle#installer#new问题
set shell=/bin/bash 
set mouse=a
set background=dark
"vundle插件管理器，1-10 vundle所需,mkdir ~/.vim; mkdir ~/.vim/bundle; 
"git clone https://github.com/gmarik/vundle.git
"设置不使用vi的键盘模式，而用vim自己的模式
set nocompatible

filetype off
execute pathogen#infect()

set rtp+=~/.vim/bundle/vundle
call vundle#begin()
"插件位置,添加完插件后，保存退出再进入vim命令模式输入:PluginInstall,安装插件
Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdtree'     "nerdtree目录树插件
"go相关的插件，依赖的go程序可通过:GoInstallBinaries,:GoUpdateBinaries更新
Plugin 'fatih/vim-go'             "go-vim包含以上go开发相关的工具插件
Plugin 'majutsushi/tagbar'        "替代taglist.vim
Plugin 'tpope/vim-fugitive'
" ruby command for rvm
"Plugin 'tpope/vim-rvm'
" quickly move cursor, try ,,w 
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Lokaltog/vim-powerline'
" quickly write HTML, just like zencoding but simple engough
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
let g:sparkupNextMapping= "<c-m>"
" power vim plugin for rails
Plugin 'tpope/vim-rails.git'
" vim rails syntax complete, try ctrl+x ctrl+u
"set completefunc=syntaxcomplete#Complete
" quickly comment your code, try ,cc on selected line
Plugin 'vim-scripts/The-NERD-Commenter'
" indent guides
let g:indent_guides_guide_size = 1
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
" indent guides shortcut
map <silent><F7>  <leader>ig
"把 F8 映射到 启动NERDTree插件
map <F8> :NERDTreeToggle<CR>
autocmd VimEnter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * TagbarToggle
" coffeescript
Plugin 'kchmck/vim-coffee-script'
" basic dependence
Plugin 'L9'
" slim template support
Plugin 'slim-template/vim-slim.git'
" hack filetype for slim
autocmd BufNewFile,BufRead *.slim set filetype=slim
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS

au Filetype go nnoremap <F3> :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>                                                                                                                                                  
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
" quickly search file(s), use ctrl+p, F5 refresh
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*.so,*.swp,*.zip
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" map <c-o> :CtrlPBuffer<CR>

" sass highlight
Plugin 'JulesWang/css.vim'
Plugin 'cakebaker/scss-syntax.vim'
Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode' 
Bundle 'Valloric/YouCompleteMe'
"Bundle 'majutsushi/tagbar'
"js插件
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'ap/vim-css-color'
call vundle#end()
" input source improve for gui vim
if has("gui_running")
  set noimdisable
  set imi=2
  set ims=2
endif

set noswapfile
"in order to switch between buffers with unsaved change
set hidden

" hightlight col and line
set cursorline
"set cursorcolumn

if has("gui_running")
  colorscheme desert
  set bs=2
  set ruler
  set gfn=Monaco:h16
  set shell=/bin/bash
endif

let mapleader= ","

"Bundle 'majutsushi/tagbar'
"把F9隐射到启动tarbar"
nmap <F10> :TagbarToggle<CR>

"nerdtreeset iskeyword+=-

" vim 7.4 backspace fix
set backspace=indent,eol,start
set hlsearch

au BufLeave * silent! up " vim buffer 切换时自动保存
execute pathogen#infect()
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let NERDTreeIgnore=['\.pyc', '\.o']

"go语法高亮设置，默认是无高亮
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 0 

"以下是独立配置，不依赖任何插件，只有基本的语法高亮
"设置delete键的增强模式
set backspace=2

"检测文件类型
filetyp on

"针对不同的文件采取不同的缩进
filetype indent on

"允许插件
filetype plugin on

"启动智能插件
filetype plugin indent on 

"语法高亮，需要在其他语法设置之前
syntax on

"设置文件被改动时自动读入
set autoread

"设置行号
set number

"设置tab键的宽度
set tabstop=4

"设置统一缩进为4
set softtabstop=4
set shiftwidth=4

"设置自动缩进
set autoindent

"设置c风格缩进
set cindent

"设置当前行下划线
set cursorline

set ruler

"在行和段的开始处使用制表符
set smarttab

"设置不要用空格代替制表符
"set noexpandtab
"设置用空格代替制表符
set expandtab


"设置历史记录
set history=100

"禁止生成临时备份文件
set nobackup
set noswapfile

"设置共享剪贴板
set clipboard+=unnamed

"搜索忽略大小写
set ignorecase

"搜索字符高亮
set hlsearch
set incsearch

"设置跳转到搜索匹配的字符处
set showmatch

"设置在vim中可以使用鼠标
set mouse=a

"设置显示匹配时间
set matchtime=5

"设置当前文字编码
set encoding=utf-8

"设置文件编码
set fileencoding=utf-8

"设置兼容文件编码
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936

"设置显示状态栏
set laststatus=4

"设置状态栏显示内容
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]

"设置显示模式
set showmode

"设置显示命令
set showcmd

"设置不自动换行nowrap,自动换行set wrap
set nowrap

"设置主题
colorscheme desert
"设置网页脚本相关的缩进
autocmd FileType haml,javascript,html,css,xml set ai
autocmd FileType haml,javascript,html,css,xml set sw=2
autocmd FileType haml,javascript,html,css,xml set ts=2
autocmd FileType haml,javascript,html,css,xml set sts=2

let g:go_fmt_command = "goimports"
command! -buffer Fmt call s:GoFormat()
function! s:GoFormat()
    let view = winsaveview()
    %!gofmt
    if v:shell_error
        %| " output errors returned by gofmt
        " TODO(dchest): perhaps, errors should
        go to quickfix
        undo
        echohl Error | echomsg "Gofmt returned error" | echohl None
    endif
    call winrestview(view)
endfunction

"add zwl
inoremap jk <ESC>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
