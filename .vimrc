"********************显示设置********************"

"## 行号"
set nu

"## 显示光标当前位置"
set ruler

"## tab为4个空格”
set ts=4
set expandtab
set shiftwidth=4


"********************功能设置********************"

"## 编码设置"
set encoding=utf-8

"## 按键映射"

  "-- ESC按键映射"
imap jj <Esc>

  "-- 窗口切换"
map h <C-W>h
map j <C-W>j
map k <C-W>k
map l <C-W>l

  "-- 全选"
map a ggVG

  "-- 保存"
map s :w<CR>
map q :x<CR>
imap s jj:w<CR>
imap q jj:x<CR>

  "-- 行首行尾跳转"
nnoremap H ^
nnoremap L $

  "-- j,k重映射"
nmap j gj
nmap k gk

"## 括号匹配"
set showmatch

"## 禁用交换文件创建"
set noswapfile

"## 下方开启终端"
set splitbelow

"## 一键运行当前脚本"
map r :call CompileRunGcc()<CR>

func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc

"**************vim-plug插件管理******************"
call plug#begin('~/.vim/plugged')

"## 目录树"
Plug 'preservim/nerdtree' 

  "-- 开启NerdTree"
map n :NERDTreeToggle<CR>


"## 补全插件"
Plug 'Valloric/YouCompleteMe'
  "-- 关闭补全预览框"
  set completeopt=longest,menu
  let g:ycm_add_preview_to_completeopt=0


"## Go用”
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

"## Tabgar"
Plug 'majutsushi/tagbar'

  "-- 开启Tagbar"
map t :TagbarToggle<CR>


"## 对齐插件"
Plug 'godlygeek/tabular'


"## 代码检查"
Plug 'dense-analysis/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enable = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_linters = {'python':['pylint']}



"## Markdown"

  "-- Markdown 语法高亮“
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

  "-- Markdown 实时预览“
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

    "-- config Markdown actions"
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_browser = 'chromium'

  "-- 快捷键"
source ~/.vim/Markdown-snippits.vim

nmap p :MarkdownPreview<CR>

"## airline"

  "-- airline"
Plug 'bling/vim-airline'

  "-- airline-themes"
Plug 'vim-airline/vim-airline-themes'

    "-- config airline-themes"
let g:airline_theme="solarized"


  "## 括号匹配“
Plug 'Raimondi/delimitMate'
call plug#end()
"************************************************”
