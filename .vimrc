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
inoremap s <Esc>:w<CR>
inoremap q <Esc>:x<CR>

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
"
" Use vim-plug to manage my vim's extensions
"
" -----   plugin list   -----
"
"   * airline               1
"     airline-themes        
"   * ale                   2
"   * coc.nvim              3
"   * delimitMate           4
"   * go                    5
"     gocode                
"   * latex                 6 
"   * markdown              7
"     markdown-preview       
"   * nerdtree              8
"   * tabular               9
"   * tagbar                10
"
"********************************************************* 

call plug#begin('~/.vim/plugged')


" 1# airline

"-- airline
Plug 'bling/vim-airline'

"-- config airline
" open the tabline
let g:airline#extensions#tabline#enabled = 1

"-- airline-themes
Plug 'vim-airline/vim-airline-themes'

"-- config airline-themes
let g:airline_theme="solarized"


" 2# ale
Plug 'dense-analysis/ale' 
let g:ale_fix_on_save=1
let g:airline#extensions#ale#enabled=1
let b:ale_linters = {'python': ['flake8', 'pylint']}


" 3# coc.nvim
Plug 'neoclide/coc.nvim',{'branch': 'release'}

"-- coc.nvim settings
set nobackup
set nowritebackup

"Use tab fo trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" 4# delimitMate
Plug 'Raimondi/delimitMate'


" 5# for Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode'


" 6# latex
Plug 'lervag/vimtex'


" 7# markdown

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

"-- open the Preview with hot key
nnoremap p :MarkdownPreview<CR>


" 8# nerdtree
Plug 'preservim/nerdtree' 

"-- open NerdTree
map n :NERDTreeToggle<CR>


" 9# tabular 
Plug 'godlygeek/tabular'


" 10# tabgar
Plug 'majutsushi/tagbar'

"-- open Tagbar
map t :TagbarToggle<CR>


call plug#end()
"************************************************”
