"*********************************************************
"**************    Display settings     ******************
"*********************************************************

"## line number & relative line number
set nu
set relativenumber

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

"## highlight the line
"set cul


"*********************************************************
"***************    Function settings   ******************
"*********************************************************

"## do not compatible with vi
set nocompatible

"## set encoding
set encoding=utf-8

"## key mapping

"-- jj to <Esc>
inoremap jj <Esc>

"-- window switch
map <A-h> <C-W>h
map <A-j> <C-W>j
map <A-k> <C-W>k
map <A-l> <C-W>l

"-- change the window size
nnoremap - <C-W>-
nnoremap = <C-W>+
nnoremap <A-,> <C-W><
nnoremap <A-.> <C-W>>

"-- select all
nnoremap <A-a> ggVG

"-- save all
nnoremap <A-s> :w<CR>
nnoremap <A-q> :x<CR>
inoremap <A-s> <Esc>:w<CR>
inoremap <A-q> <Esc>:x<CR>

"-- jump to the beginning or the end of the line
nnoremap H ^
nnoremap L $
nnoremap dH d^
nnoremap dL d$

"-- j,k remapping
nnoremap j gj
nnoremap k gk

"-- refresh the current file
nnoremap <F5> :so %<CR>

"-- change the buffer
noremap gb :bp<CR>
noremap gn :bn<CR>

"-- out of brackets
inoremap <A-f> <Esc>%% 

"-- nohighlight
nnoremap <Esc> :noh<Esc><CR>

"-- for the snippets of different file types
source ~/.config/nvim/ftplugin/Java-snippets.vim 
source ~/.config/nvim/ftplugin/Go-snippets.vim
source ~/.config/nvim/ftplugin/Markdown-snippets.vim
source ~/.config/nvim/ftplugin/Python-snippets.vim
source ~/.config/nvim/ftplugin/Shell-snippets.vim

"## disable swap file creation
set noswapfile

"## when splitting the screen vertically, it is always at the bottom
set splitbelow

"## run current script with shortcut
map <A-r> :call CompileRunGcc()<CR>

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
"   * css-color             4
"   * delimitMate           5
"   * go                    6
"     gocode                
"   * latex                 7 
"   * markdown              8
"     markdown-preview       
"   * nerdtree              9
"     nerdtree-tabs
"   * tabular               10
"   * tagbar                11
"   * youcompletme          12
"
"********************************************************* 

call plug#begin('~/.config/nvim/plugged')


" 1# airline

"-- airline
Plug 'bling/vim-airline'

"-- config airline
" open the tabline
let g:airline#extensions#tabline#enabled = 1

"-- airline-themes
Plug 'vim-airline/vim-airline-themes'

"-- config airline-themes
let g:airline_theme="fruit_punch"


" 2# ale
Plug 'dense-analysis/ale'
let g:ale_fix_on_save=1
let g:airline#extensions#ale#enabled=1
let b:ale_linters = {'python': ['flake8']}

" 3# coc.nvim
Plug 'neoclide/coc.nvim',{'branch': 'release'}

"-- coc.nvim settings
set nobackup
set nowritebackup
set cmdheight=1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" 4# css-color
Plug 'ap/vim-css-color'


" 5# delimitMate
Plug 'Raimondi/delimitMate'


" 6# for Go
Plug 'fatih/vim-go'
Plug 'nsf/gocode'


" 7# latex
"Plug 'lervag/vimtex'


" 8# markdown

"-- Markdown Syntax highlighting
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"-- Markdown real-time preview 
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

"-- config Markdown actions
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 0
let g:mkdp_browser = 'chromium'

"-- open the Preview with shortcut
nnoremap <A-p> :MarkdownPreview<CR>


" 9# nerdtree
Plug 'preservim/nerdtree' 
Plug 'jistr/vim-nerdtree-tabs'

"-- open NerdTree
map <A-n> :NERDTreeToggle<CR>


" 10# tabular 
Plug 'godlygeek/tabular'


" 11# tabgar
Plug 'majutsushi/tagbar'

"-- open Tagbar
map <A-t> :TagbarToggle<CR>


" 12# youcompletme
"Plug 'ycm-core/YouCompleteMe'
call plug#end()
"************************************************”
