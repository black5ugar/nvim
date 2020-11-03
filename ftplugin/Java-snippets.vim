autocmd FileType java inoremap sout System.out.println();<Esc>hi

" add the comment
autocmd FileType java vnoremap <leader>c I//<Space><Esc>

" remove the comment
autocmd FileType java vnoremap <leader>d 2lx
