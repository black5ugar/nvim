"*********************************************************
"**************    Display settings     ******************
"*********************************************************

"## line number & relative line number
set nu
"set relativenumber

"## display the current position of the cursor
set ruler

"## set <Tab> to for spaces
set ts=4
set expandtab
set shiftwidth=4

"## bracket matching
set showmatch

"## scrolloff
set scrolloff=5


"*********************************************************
"***************    Function settings   ******************
"*********************************************************

"## do not compatible with vi
set nocompatible

"## set encoding
set encoding=utf-8

"## key mapping

"-- <Esc> key mapping
inoremap jj <Esc>

"-- window switch
map h <C-W>h
map j <C-W>j
map k <C-W>k
map l <C-W>l

"-- change the window size
nnoremap - <C-W>-
nnoremap = <C-W>+
nnoremap , <C-W><
nnoremap . <C-W>>

"-- select all
nnoremap a ggVG

"-- save all
nnoremap s :w<CR>
nnoremap q :x<CR>
inoremap s jj:w<CR>
inoremap q jj:x<CR>

"-- jump to the beginning or the end of the line
nnoremap H ^
nnoremap L $

"-- j,k remapping
nnoremap j gj
nnoremap k gk

"-- refresh the current file
nnoremap <F5> :so %<CR>

"## disable swap file creation
set noswapfile

"## when splitting the screen vertically, it is always at the bottom
set splitbelow

"## run current script with one click
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
        exec "!chromium % &"
    elseif &filetype == 'go'
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!chromium %.html &"
    endif
endfunc


"*********************************************************
"**************  Vim-plug plugin management  *************
"*********************************************************

call plug#begin('~/.vim/plugged')

"## Nerdtree
Plug 'preservim/nerdtree' 

"-- open NerdTree
map n :NERDTreeToggle<CR>


"## YouCompleteMe
Plug 'Valloric/YouCompleteMe'

"-- close the preview
set completeopt=longest,menu
let g:ycm_add_preview_to_completeopt=0


"## for Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode'

"## Tabgar
Plug 'majutsushi/tagbar'

"-- open Tagbar
map t :TagbarToggle<CR>


"## Tabular 
Plug 'godlygeek/tabular'


"## Ale
Plug 'dense-analysis/ale'
let g:ale_fix_on_save = 1
let g:ale_completion_enable = 1
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_linters = {'python':['pylint']}



"## Markdown

"-- Markdown Syntax highlighting
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"-- Markdown real-time preview 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"-- config Markdown actions
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_browser = 'chromium'

"-- Markdown hot key
source ~/.vim/Markdown-snippits.vim

nnoremap p :MarkdownPreview<CR>


"## Airline

"-- airline
Plug 'bling/vim-airline'

"-- config airline
" open the tabline
let g:airline#extensions#tabline#enabled = 1

"-- airline-themes
Plug 'vim-airline/vim-airline-themes'

"-- config airline-themes
let g:airline_theme="solarized"


"## DelimitMate
Plug 'Raimondi/delimitMate'
call plug#end()
"************************************************”
