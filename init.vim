"---------------------------------------------------------
"---------- this is my neovim config settings ------------
"----------       created by: black5ugar      ------------
"---------------------------------------------------------


"*********************************************************
"**************    Display settings     ******************
"*********************************************************

"## encoding
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1
set enc=utf-8
set fencs=utf-8,gbk,gb2312,gb18030

"## color theme
"colorscheme blue

"## line number & relative line number
set nu
set relativenumber

"## display the current position of the cursor
set ruler

"## set <Tab> to four spaces
set ts=4
set expandtab
set shiftwidth=4

"## bracket matching
"set showmatch

"## scrolloff
set scrolloff=5

"## highlight the line
"set cul


"*********************************************************
"***************    Function settings   ******************
"*********************************************************

"## use mouse
"set mouse=a

"## do not compatible with vi
set nocompatible

"## set the connection to the system clipboard
set clipboard+=unnamedplus

"## set encoding
set encoding=utf-8

"## key mapping

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
nnoremap cH c^
nnoremap cL c$
vnoremap H ^
vnoremap L $

"-- j,k remapping
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

"-- refresh the current file
nnoremap <F5> :so %<CR>

"-- change the buffer
noremap gb :bp<CR>
noremap gn :bn<CR>

"-- out of brackets
"inoremap <A-f> <Esc>%% 

"-- nohighlight
nnoremap <Esc> :noh<Esc><CR>

"-- Open the file in binary form
:command B %!xxd 
:command BB %!xxd -r

"-- Open the terminal
command! -nargs=* T split | resize 10 | terminal <args>

"-- for the snippets of different file types
source ~/.config/nvim/ftplugin/Java-snippets.vim 
source ~/.config/nvim/ftplugin/Go-snippets.vim
source ~/.config/nvim/ftplugin/Markdown-snippets.vim
source ~/.config/nvim/ftplugin/Python-snippets.vim
source ~/.config/nvim/ftplugin/Shell-snippets.vim
source ~/.config/nvim/ftplugin/C_Cpp-snippets.vim

"-- some function
source ~/.config/nvim/ftplugin/Function.vim

"## disable swap file creation
set noswapfile

"## when splitting the screen vertically, it is always at the bottom
set splitbelow


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
"   * nerdcommenter         10
"   * tabular               11
"   * tagbar                12
"   * youcompletme          13
"   * fzf                   14
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
"Plug 'dense-analysis/ale'
"let g:ale_fix_on_save=1
"let g:airline#extensions#ale#enabled=1
"let b:ale_linters = {'python': ['flake8']}


" 3# coc.nvim
Plug 'neoclide/coc.nvim',{'branch': 'release'}

"-- coc.nvim settings
set nobackup
set nowritebackup

"-- Use tab for trigger completion with characters ahead and navigation
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


"-- Use [g and ]g to navigate diagnostics
"-- Use 'CocDiagnostics' to get all diagnostics of current buffer in location list
nmap [g <Plug>(coc-diagnostic-prev)
nmap ]g <Plug>(coc-diagnostic-next)

"-- Go to code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-- Symbol renaming
nmap <leader>r <Plug>(coc-rename)

"-- Apply AutoFix to problem on the current line.
nmap <leader>f <Plug>(coc-fix-current)

"-- Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


" 4# css-color
Plug 'ap/vim-css-color'


" 5# delimitMate
Plug 'Raimondi/delimitMate'
let delimitMate_expand_cr = 1


" 6# for Go
Plug 'fatih/vim-go'
"Plug 'nsf/gocode'


" 7# latex
"Plug 'lervag/vimtex'


" 8# markdown

"-- Markdown Syntax highlighting
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

"-- Markdown real-time preview 
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

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


" 10# nerdcommenter
Plug 'preservim/nerdcommenter'

"-- Create default mappings
let g:NERDCreateDefaultMappings = 1

"-- Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"-- Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

"-- Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

"-- Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

"-- Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

"-- Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"-- Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

"-- Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" 11# tabular 
Plug 'godlygeek/tabular'


" 12# tabgar
Plug 'majutsushi/tagbar'

"-- open Tagbar
map <A-t> :TagbarToggle<CR>


" 13# youcompletme
"Plug 'ycm-core/YouCompleteMe'

" 14# fzf
Plug 'junegunn/fzf', {'do': { -> fzf#install()}}
Plug 'junegunn/fzf.vim'

" 15# ici
Plug 'Flowerowl/ici.vim'

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

call plug#end()
"************************************************”
