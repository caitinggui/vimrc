set nocompatible             " 设置不兼容vi"
set encoding=utf-8           " 设置支持utf-8格式文件
set clipboard=unnamed        "使用系统剪切板
set backspace=indent,eol,start "设置退格键生效
set nu                       "使用行号
set tabstop=4                "设置table长度"
set pastetoggle=<F6>         "在paste和nopaste中切换, 解决从剪切板黏贴缩进异常问题
set fileencoding=utf-8       "设置保存文件的格式为utf-8,在已打开的文件中输入此命令会修改已打开的文件编码
let mapleader=";"
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936  "逐一探测即将打开的文件的字符编码方式
set encoding=utf-8           "Vim 内部使用的字符编码方式，包括 Vim 的 buffer (缓冲区)、菜单文本、消息文本等
set termencoding=utf-8       "vim显示的编码，需要和当前终端编码设置相同
":set fileencoding=utf-8     "在打开的终端中输入则强制保存改文件为utf-8编码，不管它之前是什么编码
map <leader>sudo :w !sudo tee %<CR>   "临时使用root权限保存文档

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
" see docstring
let g:SimpylFold_docstring_preview=1
Plugin 'tmhedberg/SimpylFold'



" For indent and PEP8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufNewFile,BufRead *.js,*.html,*.css
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
	\ setlocal shiftwidth=2
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
Plugin 'vim-scripts/indentpython.vim'



" For YouCompleteMe
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 "收集注释中的字符串
let g:ycm_autoclose_preview_window_after_completion=1
" 回车即选中当前项
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
" 表示跳转到定义处
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" 支持在virtualenv中使用
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
Bundle 'Valloric/YouCompleteMe'



" For syntastic 
let python_highlight_all=1
syntax on
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'



" For NERDTree
" F2开启和关闭树
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeWinSize=25
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd l
" 当前无文件时,nerdtree自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
Plugin 'scrooloose/nerdtree'



" A plugin of NERDTree showing git status
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "^",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "-",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
Plugin 'Xuyuanp/nerdtree-git-plugin'



" For run python
map <F5> :call RunPython()<CR>
function RunPython()
  let mp = &makeprg
  let ef = &errorformat
  let exeFile = expand("%:t")
  setlocal makeprg=python\ -u
  set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
  silent make %
  copen
  let &makeprg = mp
  let &errorformat = ef
endfunction



" 自动补全括号等以及多行注释
" <leader>cc行前注释, <leader>cu解除注释
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'

"autopep8设置"
let g:autopep8_disable_show_diff=1
let g:autopep8_max_line_length=79
Plugin 'tell-k/vim-autopep8'



" global catalog search
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file':'\v\.(exe|so|dll)$'}
Plugin 'kien/ctrlp.vim'



" For function list and macro
map <F3> :TagbarToggle<CR>
let g:tagbar_width=25
let g:tagbar_sort=1
au BufNewFile,BufRead *.py,*.c,*.cpp call tagbar#autoopen()
Plugin 'majutsushi/tagbar'



" For global characters search
map f <Plug>CtrlSFPrompt
let g:ctrlsf_ignore_dir = ["tmp", "env", "venv", "logs", ".tox"]
Plugin 'dyng/ctrlsf.vim'


" For beautiful theme
" remember the Plugin should be first or it will not work
Plugin 'altercation/vim-colors-solarized'
let g:solarized_termcolors=256
if !exists("install_flag")
    colorscheme solarized
    call togglebg#map("<F4>")
    set cursorline               " 突出显示当前行
endif
set background=dark
" set more blue
let &background="light"


" For status bar
set guifont=Inconsolata\ for\ Powerline:h15
set t_Co=256
set laststatus=2
" 如果状态栏出现乱码，请修改'fancy'为'unicode'
let g:Powerline_symbols = 'fancy'
"let Powerline_symbols='compatible'
Plugin 'Lokaltog/vim-powerline'



" 插入模式下的光标移动
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-e> <End>
inoremap <C-a> <Home>
